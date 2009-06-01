// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// UsersTable constructor
// Creates a table for a CSR's issue queue

function UsersTable(tableId) {
  this.table = document.getElementById(tableId);
  this.rows = document.getElementsByTagName('tr');
  this.userBaseUrl = '/users/';
  this.setRowListeners();
}

UsersTable.prototype.setRowListeners = function() {
  for(var row, i=0; row=this.rows[i]; i++) {
    goog.events.listen(row, 'click', goog.bind(this.handleIssueClick, 
                                               this,
                                               row.id));
  }
}

UsersTable.prototype.handleIssueClick = function(issueId) {
  destinationUrl = this.issueBaseUrl + issueId;
  document.location = destinationUrl;
}