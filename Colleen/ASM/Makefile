# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/05 11:40:11 by user42            #+#    #+#              #
#    Updated: 2021/11/06 14:11:56 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Colleen

CC = nasm
LD = gcc

CFLAGS = -f elf64
LDFLAGS = -no-pie

SRCS = Colleen.s

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

re:				fclean all

.PHONY:			all clean fclean re
