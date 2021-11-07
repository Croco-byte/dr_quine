# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/05 11:40:11 by user42            #+#    #+#              #
#    Updated: 2021/11/06 15:35:54 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Grace

CC = nasm
LD = gcc

CFLAGS = -f elf64
LDFLAGS = -no-pie

SRCS = Grace.s

OBJS = ${SRCS:.s=.o}

all:		$(NAME)

$(NAME):	$(OBJS)
			$(LD) $(LDFLAGS) -o $(NAME) $(OBJS)

%.o:%.s
				${CC} ${CFLAGS} $< -o $@

clean:
				rm -f $(OBJS)

fclean:
				rm -f $(OBJS)
				rm -f $(NAME)
				rm -f Grace_kid.s

re:				fclean all

.PHONY:			all clean fclean re
