//all our AJAX requests go here, named exports

export const fetchChirps = () => {
  // ajax returns a promise that we can call .then on
  return $.ajax({
      method: 'GET',
      url: '/api/chirps',
  });
};

export const fetchChirp = (id) => {
  return $.ajax({
    method: 'GET',
    url: `/api/chirps/${id}`,
  });
};

export const createChirp = (chirp) => {
  return $.ajax({
      method: 'POST',
      url: '/api/chirps',
      data: { chirp: chirp },
  });
};