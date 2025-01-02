/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ray.h                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jihyjeon <jihyjeon@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/08 17:11:36 by junhyeop          #+#    #+#             */
/*   Updated: 2025/01/02 16:27:33 by jihyjeon         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef RAY_H
# define RAY_H

# include "vec.h"
# include "structure.h"

typedef struct	s_ray
{
	t_point3	orig;
	t_vec3		dir;
}				t_ray;

t_ray			ray_set(t_point3 origin, t_vec3 direction);
t_point3		ray_at(t_ray ray, double t);
t_ray			ray_primary(t_camera *cam, double u, double v);
t_color3		ray_color(t_ray *r);
t_bool			hit_sphere(t_sphere *sp, t_ray *ray);

#endif
