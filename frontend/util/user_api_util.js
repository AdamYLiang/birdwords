export const fetchUser = id => {
  return $.ajax({
    method: 'GET',
    url: `api/users/${id}`,
  });
};

export const fetchUsers = () => {
  // debugger
  return $.ajax({
    method: 'GET',
    url: '/api/users'
  });
}; 