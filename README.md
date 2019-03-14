# ansible-bonjour_role

Role sample to show how to integrate versions, document it, structure and test it

## Ansible requirements

### Ansible version

Minimum required ansible version is 2.7.

### Ansible role dependencies

None.

## User guide

Content of this file will be literally inserted into the resulting README.
Below are some suggested subsections.

### Requirements

Explain your role requirements.

e.g:
* The server needs WWW access
* The server needs to access internal repos
* ...

### Introduction

In case your role is complex you might want ot explain here the rational of
certain behaviors and/or concepts.

### Usage

Some role usage scenarios and examples.

## Role Variables

Variables are divided in three types.

The [default vars](#default-vars) section shows you which variables you may
override in your ansible inventory. As a matter of fact, all variables should
be defined there for explicitness, ease of documentation as well as overall
role manageability.

The [mandatory variables](#mandatory-variables) section contains variables that
for several reasons do not fit into the default variables. As name implies,
they must absolutely be defined in the inventory or else the role will
fail. It is a good thing to avoid reach for these as much as possible and/or
design the role with clear behavior when they're undefined.

The [context variables](#context-variables) are shown in section below hint you
on how runtime context may affects role execution.

None.

### Mandatory variables

['bonjour_nom', 'bonjour_prenom']

### Context variables

Those variables from `vars/*.{yml,json}` are loaded dynamically during task
runtime using the `include_vars` module.

Variables loaded from `vars/main.yml`.

```yaml
bonjour_machine: '{{ ansible_machine }}'
#bonjour_nom: Elimane
#bonjour_prenom: GUEYE

```


## Required variables:
| Parameter      | Example    | Default    | Comment |
|----------------|------------|------------|---------|
|`bonjour_nom`|`Brito`|`it is required, there are not default`|Last name|


## Todo

You want to contribute? Here's a wishlist:

  * Create documentation
  * review testing strategy

Consider opening an issue to share your intent and avoid work duplication!

## License

license (GPLv2, CC-BY, etc).

## Author Information

Elimane GUEYE.

