tree_out = "Khrenov.pl"
tree_in = "Khrenov.ged"




persons = []
families = []

with open(tree_in, "r") as f:
    lines = f.readlines()

name = ""
sex = ""
id = ""

for l in lines:
    word = l.split(' ')
    
    if (len(word) == 3 and word[2][:-2] == "INDI"):
        id = word[1]
    if word[1] == "GIVN":
        name = word[2][:-2].lower()
    if word[1] == "SURN":
        name += " "
        name += word[2][:-2].lower()
    if word[1] == "SEX":
        sex = word[2][:-2]
    
    if (name != "" and sex != "" and id != ""):
        persons.append([name, sex, id])
        name = ""
        sex = ""
        id = ""



def idname(id):
    for p in persons:
        if p[2] == id:
            return p[0]


hus = ""
wif = ""
chil = []
for l in lines:
    word = l.split(' ')
    if word[1] == "HUSB":
        hus = word[2][:-2]
    if word[1] == "WIFE":
        wif = word[2][:-2]
    if word[1] == "CHIL":
        chil.append(word[2][:-2])
    if (len(word) == 3 and word[1] == "_UID" and (hus != '' or wif != '')):
        families.append([hus, wif, chil])
        hus = ''
        wif = ''
        chil = []

out = ''


for f in families:
    if f[2] != []:
        for ch in f[2]:
            if f[0] != '':
                out += 'child("{}","{}").\n'.format( str(idname(ch)), str(idname(f[0])) )
            if f[1] != '':
                out += 'child("{}","{}").\n'.format( str(idname(ch)), str(idname(f[1])) )

for p in persons: 
    if p[1] == "M":
        out += 'male("{}").\n'.format(p[0])
for p in persons:
    if p[1] == "F":
        out += 'female("{}").\n'.format(p[0])
        
with open(tree_out, "w") as output:
    output.write(out)
