# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: junhyeong <junhyeong@student.42.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/18 14:55:11 by junhyeop          #+#    #+#              #
#    Updated: 2025/02/18 21:40:28 by junhyeong        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = miniRT
NAME_BONUS = miniRT_bonus

INCDIR    = ./inc
LIBDIR    = ./lib
SRCDIR    = ./src
BONUS_DIR = ./bonus
LIBFTDIR  = $(LIBDIR)
MLXDIR    = $(LIBDIR)/mlx

SRC =	$(SRCDIR)/main.c \
		$(SRCDIR)/parse/parse_file.c \
		$(SRCDIR)/parse/parse.c \
		$(SRCDIR)/parse/parse_init.c \
		$(SRCDIR)/parse/parse_object.c \
		$(SRCDIR)/parse/parse_utils.c \
		$(SRCDIR)/utils/utils.c \
		$(SRCDIR)/utils/error.c \
		$(SRCDIR)/utils/object.c \
		$(SRCDIR)/utils/light.c \
		$(SRCDIR)/rt/camera.c \
		$(SRCDIR)/rt/hit.c \
		$(SRCDIR)/rt/hit_cylinder.c \
		$(SRCDIR)/rt/hit_cone.c \
		$(SRCDIR)/rt/ray.c \
		$(SRCDIR)/rt/run.c \
		$(SRCDIR)/rt/vec1.c \
		$(SRCDIR)/rt/vec2.c \
		$(SRCDIR)/rt/vec3.c \
		$(SRCDIR)/rt/window.c \
		$(SRCDIR)/rt/light.c \
		$(SRCDIR)/rt/anti_alias.c

SRC_BONUS =	$(BONUS_DIR)/$(SRCDIR)/main_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/parse/parse_file_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/parse/parse_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/parse/parse_init_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/parse/parse_object_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/parse/parse_utils_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/utils/utils_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/utils/error_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/utils/object_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/utils/light_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/camera_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/hit_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/hit_cylinder_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/hit_cone_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/ray_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/run_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/vec1_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/vec2_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/vec3_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/window_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/light_bonus.c \
			$(BONUS_DIR)/$(SRCDIR)/rt/anti_alias_bonus.c

OBJS       = $(SRC:.c=.o)
OBJS_BONUS = $(SRC_BONUS:.c=.o)

LIBFT = $(LIBFTDIR)/libft.a
MLX   = $(MLXDIR)/libmlx.a

CC      = cc
CFLAGS  = -Wall -Wextra -Werror

# 리눅스에서는 X11 관련 라이브러리(-lXext, -lX11)를 링크합니다.
GL_LINK = -L$(MLXDIR) -lmlx -lXext -lX11 -lm
FT_LINK = -lft -L$(LIBFTDIR)

# inc와 bonus/inc 둘 다 포함
INCLUDES = -I$(INCDIR) -I$(BONUS_DIR)/$(INCDIR) -I$(MLXDIR) -I$(LIBFTDIR)

RM = rm -f

all: $(NAME)

%.o: %.c $(HEADER)
	@$(CC) $(CFLAGS) -c $(INCLUDES) $< -o $@
	
$(NAME): $(LIBFT) $(MLX) $(OBJS)
	@$(CC) $(CFLAGS) $(OBJS) $(FT_LINK) $(GL_LINK) -o $(NAME)
	@echo "$(NAME): object file and $(NAME) created"

$(NAME_BONUS): $(LIBFT) $(MLX) $(OBJS_BONUS)
	@$(CC) $(CFLAGS) $(OBJS_BONUS) $(FT_LINK) $(GL_LINK) -o $(NAME_BONUS)
	@echo "$(NAME_BONUS): object file and $(NAME_BONUS) created"

$(LIBFT):
	@$(MAKE) -sC $(LIBFTDIR)
	@echo "$(NAME): $(LIBFT) created"

$(MLX):
	@$(MAKE) -sC $(MLXDIR)
	@echo "$(NAME): $(MLX) created"

clean:
	@$(MAKE) -sC $(MLXDIR) clean
	@$(MAKE) -sC $(LIBFTDIR) clean
	@$(RM) $(OBJS) $(OBJS_BONUS)
	@echo "$(NAME): objects deleted"

fclean: clean
	@$(RM) $(MLX)
	@$(RM) $(LIBFT)
	@$(RM) $(NAME) $(NAME_BONUS)
	@echo "$(NAME): $(NAME), $(NAME_BONUS), $(MLX), $(LIBFT) deleted"

re: fclean all

bonus: $(NAME_BONUS)

.PHONY: all clean fclean re bonus
