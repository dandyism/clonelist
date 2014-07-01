Clonelist.Models.Post = Backbone.Model.extend({
  urlRoot: '/posts',

  can: function(action) {
    if (this._ability) {
      return this._ability.can(action, "Post");
    }
    
    return false;
  },

  parse: function(response) {
    if (response.abilities) { 
      this._ability = new Ability({ rules: response.abilities });
      delete response.abilities;
    }
    
    return response;
  }
}, { backboneClass: "Post" });
