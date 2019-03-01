bonjour
============

Illustration.

Requis
------------

Variables du role
--------------

| Name                    | Default value          | Description    |
|-------------------------|------------------------|--------------- |
| bonjour_nom       | Null (Requis)          | Nom            |
| bonjour_prenom    | Null (Requis)          | Prenom         |
| bonjour_machine   | '{{ ansible_machine }}'| ansible_machine|

Dependances
------------
Aucune

Exemple
----------------

```
---
- name: "Tests bonjour"
  hosts: all
  roles:
    - role: bonjour
      vars:
        bonjour_nom: GUEYE
        bonjour_prenom: Elimane
  tasks:
    - name: "Test-1 : validation message"
      fail: msg="Le message ne contient pas Bonjour"
      when: "'Bonjour Elimane GUEYE' not in bonjour_out.stdout"
~ 
```

License
-------

Apache License Version 2.0

Author Information
------------------

Elimane GUEYE (elimane.gueye@gmail.com)
