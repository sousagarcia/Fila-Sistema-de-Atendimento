#!/usr/bin/perl
# Copyright 2008, 2009 - Oktiva Comércio e Serviços de Informática Ltda.
#
# Este arquivo é parte do programa FILA - Sistema de Atendimento
#
# O FILA é um software livre; você pode redistribui-lo e/ou modifica-lo
# dentro dos termos da Licença Pública Geral GNU como publicada pela
# Fundação do Software Livre (FSF); na versão 2 da Licença.
#
# Este programa é distribuido na esperança que possa ser util, mas SEM
# NENHUMA GARANTIA; sem uma garantia implicita de ADEQUAÇÂO a qualquer
# MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a Licença Pública Geral GNU
# para maiores detalhes.
#
# Você deve ter recebido uma cópia da Licença Pública Geral GNU, sob o
# título "LICENCA.txt", junto com este programa, se não, escreva para a
# Fundação do Software Livre(FSF) Inc., 51 Franklin St, Fifth Floor,

use strict;
use warnings;
use lib 'lib';
use SQL::Translator;

my $t = SQL::Translator->new(
  show_warnings     => 1,
  add_drop_table    => 1,
  quote_table_names => 1,
  quote_field_names => 1,
  validate          => 1,
  producer_args     => {
    output_type => 'svg',
  }
);
$t->parser_args( 'DBIx::Schema' => 'Fila::Servico::DB', );
my $r = $t->translate(
  from => 'SQL::Translator::Parser::DBIx::Class',
  to   => 'GraphViz',
) or die $t->error;
print $r;
