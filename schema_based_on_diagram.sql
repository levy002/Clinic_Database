/* Database schema to keep the structure of entire database. */

CREATE TABLE patients(
    id SERIAL PRIMARY KEY NOT NULL,
    name VERCHAR(255),
    date_of_birth DATE
);

CREATE TABLE medical_histories(
    id SERIAL PRIMARY KEY NOT NULL,
    admitted_at TIMESTAMP,
    patient_id BIGINT,
    status VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE TABLE treatments(
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(255),
    name VARCHAR(255)
);

CREATE TABLE medical_treatments(
    id SERIAL PRIMARY KEY NOT NULL,
    medical_history_id BIGINT,
    treatment_id BIGINT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);

CREATE TABLE invoices((
    id SERIAL PRIMARY KEY NOT NULL,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
))

CREATE TABLE invoice_items(
    id SERIAL PRIMARY KEY NOT NULL,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id BIGINT,
    treatment_id BIGINT,
    FOREIGN KEY (treatment_id) REFERENCES treatments (id),
    FOREIGN KEY (invoice_id) REFERENCES invoices (id)
);