import { DataTypes } from "sequelize";
import sequelize from './database.js';

const Person = sequelize.define(
    'Person',
    {
        party_id: {
            type: DataTypes.STRING,
            primaryKey: true,
        },
        first_name: {
            type: DataTypes.STRING,
        },
        last_name: {
            type: DataTypes.STRING,
        }
    },
    {
        tableName: 'person',
        freezeTableName: true,
        timestamps: false,
    }
);

export default Person;