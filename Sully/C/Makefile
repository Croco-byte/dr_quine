# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/05 11:40:11 by user42            #+#    #+#              #
#    Updated: 2021/11/05 16:20:36 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Sully

CC = clang

CFLAGS = -Wall -Werror -Wextra -I includes/
# -fsanitize=address -g3 -fno-omit-frame-pointer 

SRCS =	Sully.c

OBJS = ${SRCS:.c=.o}

all:		$(NAME)

$(NAME):	$(OBJS)
			$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

%.o:%.c
				${CC} ${CFLAGS} -c $< -o $@

clean:
				rm -f $(OBJS)

fclean:
				rm -f $(OBJS)
				rm -f $(NAME)
				rm -f Sully_*

re:				fclean all

.PHONY:			all clean fclean re
