/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: junhyeong <junhyeong@student.42.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/12/31 01:24:52 by junhyeong         #+#    #+#             */
/*   Updated: 2025/01/01 21:02:25 by junhyeong        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/error_handle.h"

void error_handle(char *msg)
{
	printf("%s", msg);
	exit(1);
}
