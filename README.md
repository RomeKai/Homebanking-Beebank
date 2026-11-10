# 🐝 Beebank: full stack home banking

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Django](https://img.shields.io/badge/Django-092E20?style=flat-square&logo=django&logoColor=white)
![Django REST Framework](https://img.shields.io/badge/DRF-A30000?style=flat-square&logo=django&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white)
![Next.js](https://img.shields.io/badge/Next.js-13-000000?style=flat-square&logo=nextdotjs&logoColor=white)
![React](https://img.shields.io/badge/React-18-20232A?style=flat-square&logo=react&logoColor=61DAFB)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-7952B3?style=flat-square&logo=bootstrap&logoColor=white)
![ITBA](https://img.shields.io/badge/ITBA-Full%20Stack%20certification-1F4E79?style=flat-square)

Final project for the **ITBA Full Stack Developer certification**: a home banking web app with a Django REST API and a Next.js frontend.

## Features

- Customer registration and login on Django's built-in auth
- Accounts and balances, branches (`sucursal`) and loans, plus transfer screens in the frontend
- REST endpoints for customers, accounts, branches and loans
- Database triggers that keep balances consistent:
  - `after_insert_auth_user_cliente` / `after_insert_auth_user_empleado` fill in customer or employee data when a user is created
  - `after_insert_prestamo` / `after_delete_prestamo` update the linked account's balance when a loan is granted or removed
- Public pages: home, FAQ and support

## Project structure

```
Homebanking-Beebank/
├── backend/            # Django + Django REST Framework
│   ├── webProject/     # settings, urls
│   ├── cliente/        # customers
│   ├── cuenta/         # accounts
│   ├── prestamo/       # loans
│   └── sucursal/       # branches
├── frontend/           # Next.js 13 (App Router) + Bootstrap
│   └── src/app/        # cuentas, transferencias, prestamos, soporte, ...
└── documentation/      # sprint notes and migration scripts
```

## Run it locally

**Backend**

```bash
cd backend
python -m venv .venv && source .venv/bin/activate
pip install django djangorestframework django-cors-headers
python manage.py migrate
python manage.py runserver
```

**Frontend**

```bash
cd frontend
npm install
npm run dev
```

Then open http://localhost:3000.

## Documentation

Sprint notes and the roadmap are in [`documentation/readme.md`](documentation/readme.md).
