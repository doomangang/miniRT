/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error_handle.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jihyjeon <jihyjeon@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/12/31 00:36:54 by junhyeong         #+#    #+#             */
/*   Updated: 2025/01/18 14:36:08 by jihyjeon         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef ERROR_HANDLE_H
# define ERROR_HANDLE_H

# include <stdio.h>
# include <stdlib.h>

# define OPEN_ERROR "Error: open error\n"
# define ARGC_ERROR "Error: Invalid arguments\n"
# define MALLOC_ERROR "Error: malloc error\n"
# define RT_FILE_ERROR "Error: Invalid rt file\n"
# define INVALID_IDENTIFIER "Error: invalid identifier\n"
# define INVALID_SHAPE "Error: invalid shape\n"
# define READ_ERROR "Error: read error\n"

void	error_handle(char *msg);

#endif