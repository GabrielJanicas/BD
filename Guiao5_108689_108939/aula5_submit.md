# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
Write here your answer e.g:
π Ssn, Fname, Lname ((project) ⨝ Pnumber = Pno works_on ⨝ Essn = Ssn (employee))
```


### *b)* 

```
π Fname,Minit,Lname (
employee ⨝ employee.Super_ssn = Chefe.Ssn
ρ Chefe π Ssn σ Fname='Carlos' ∧ Minit = 'D' ∧ Lname = 'Gomes' employee)

```


### *c)* 

```
π Pname,total_worked (
project ⨝ Pnumber = Pno
γ Pno;sum(Hours) -> total_worked works_on )

```


### *d)* 

```
π Fname, Minit, Lname, Hours (
σ works_on.Hours > 20 ∧ project.Pname = 'Aveiro Digital' ∧ project.Dnum = 3
(project ⨝ Pnumber = Pno works_on) ⨝ Essn = Ssn employee
)
```


### *e)* 

```
π Fname,Minit,Lname (
σ works_on.Essn = null
(works_on ⟖ Essn = Ssn employee)
)

```


### *f)* 

```
S = department ⨝ Dnumber=Dno σ Sex='F' (employee)
γDname;avg(Salary) -> med (S)

```


### *g)* 

```
DEP = σ count>1 (γ Essn; count(Essn) -> count dependent)
π Fname (DEP ⨝ Essn=Ssn employee)
```


### *h)* 

```
NODEP = σEssn=null (dependent ⟖ Essn=Ssn employee)
π Fname,Minit,Lname (department ⨝ Mgr_ssn=Ssn NODEP)

```


### *i)* 

```

Loc = σDlocation!='Aveiro'∧Plocation='Aveiro' (project ⨝Dnum=Dnumber dept_location)
π Fname, Minit, Lname (employee ⨝ Dno=Dnumber Loc)

```


## ​Problema 5.2

### *a)*

```
π nome,nif,fax,endereco,condpag,tipo (
σ encomenda.fornecedor = null
(encomenda ⟖ fornecedor = nif fornecedor)
)
```

### *b)* 

```
π nome,Avg_unidades (
produto ⨝ codigo = codProd
γ codProd;avg(unidades) -> Avg_unidades item
)

```


### *c)* 

```

γ ;avg(avg_produtos) -> avg_produtos (γ numEnc; count(codProd) -> avg_produtos (item))

```


### *d)* 

```

γ fornecedor.nome, produto.nome; sum(item.unidades) -> unidades
(
produto ⨝ codigo=codProd 
item ⨝ numEnc=numero 
encomenda ⨝ fornecedor=nif fornecedor
)

```


## ​Problema 5.3

### *a)*

```
npres = σnumPresc=null (prescricao ⟗ paciente)
π nome, paciente.numUtente (npres)

```

### *b)* 

```
numpres = γespecialidade;count(numPresc)->total (prescricao ⨝ numMedico=numSNS medico)
π especialidade, total (numpres)

```


### *c)* 

```

numpres = γendereco;count(numPresc)->total (prescricao ⨝ farmacia=nome farmacia)
(numpres ⨝ farmacia)

```


### *d)* 

```
... Write here your answer ...
```

### *e)* 

```
... Write here your answer ...
```

### *f)* 

```
presdif = σ medicoDif>1 (γ numUtente; count(numMedico)->medicoDif (πnumUtente, numMedico prescricao))
π nome (paciente ⨝ paciente.numUtente=prescricao.numUtente presdif)

```
