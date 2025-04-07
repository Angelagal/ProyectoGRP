import Party from "./Party.js";
import Person from "./Person.js";
import UserLogin from "./UserLogin.js";

Party.hasOne(Person, { foreignKey: 'party_id', as: 'person' });
Person.belongsTo(Party, { foreignKey: 'party_id', as: 'party' });
Party.hasMany(UserLogin, { foreignKey: 'party_id', as: 'user_login' });
UserLogin.belongsTo(Party, { foreignKey: 'party_id', as: 'party' });

export {Party, Person, UserLogin};