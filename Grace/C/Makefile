# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/05 11:40:11 by user42            #+#    #+#              #
#    Updated: 2021/11/05 14:48:37 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Grace

CC = clang

CFLAGS = -Wall -Werror -Wextra -I includes/
# -fsanitize=address -g3 -fno-omit-frame-pointer 

SRCS =	Grace.c

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
				rm -f Grace_kid.c

re:				fclean all

.PHONY:			all clean fclean re
