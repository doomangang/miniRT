/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parse.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jihyjeon <jihyjeon@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/01 20:43:23 by junhyeong         #+#    #+#             */
/*   Updated: 2025/01/18 19:31:44 by jihyjeon         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PARSE_H
# define PARSE_H

# include "bool.h"
# include "error_handle.h"
# include "minirt.h"
# include "struct_set.h"
# include "utils.h"
# include <math.h>

// // file.c
t_bool	open_file(t_data *rt, char *file);
t_bool	is_rt_file(char *file);
t_bool	read_file(t_data *rt, int fd);
char	*sanitize_line(char *line);

// // parse.c
t_bool	parse_line(t_data *rt, char *line);
void	parse_shape(t_data *rt, char *line, int id, int nb_params);

// // parse_init.c
void	parse_resolution(t_data *rt, char *line);
void	parse_ambient(t_data *rt, char *line);
void	parse_light(t_data *rt, char *line);
void	parse_camera(t_data *rt, char *line);

// parse_utils.c
t_bool	parse_double(char *str, double *num);
t_bool	parse_color(char *str, t_color3 *color);
t_bool	parse_vector(char *str, t_vec3 *vector);
t_bool	parse_ulong(char *str, unsigned long *num);

// // parse_objects.c
void	parse_sphere(char **split, t_obj *obj);
void	parse_plane(char **split, t_obj *obj);
void	parse_cone(char **split, t_obj *obj);
void	parse_cylinder(char **split, t_obj *obj);
void	parse_triangle(char **split, t_obj *obj);

#endif