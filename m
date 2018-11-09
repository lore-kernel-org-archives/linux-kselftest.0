From: sdf@fomichev.me (Stanislav Fomichev)
Date: Fri, 9 Nov 2018 07:42:46 -0800
Subject: [PATCH v4 bpf-next 5/7] bpftool: add loadall command
In-Reply-To: <30359d0f-40c0-27c9-cd4e-bba60c6cb138@netronome.com>
References: <20181109002213.5914-1-s@fomichev.me>
 <20181109002213.5914-6-s@fomichev.me>
 <30359d0f-40c0-27c9-cd4e-bba60c6cb138@netronome.com>
Message-ID: <20181109154246.f4vpeewji6wk6iww@mini-arch>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109154246.n1xmYSoyYsleZ2z9p2MgaIRuofLfw8XsWcvgrJuZUsM@z>

On 11/09, Quentin Monnet wrote:
> 2018-11-08 16:22 UTC-0800 ~ Stanislav Fomichev <sdf at fomichev.me>
> > From: Stanislav Fomichev <sdf at google.com>
> > 
> > This patch adds new *loadall* command which slightly differs from the
> > existing *load*. *load* command loads all programs from the obj file,
> > but pins only the first programs. *loadall* pins all programs from the
> > obj file under specified directory.
> > 
> > The intended usecase is flow_dissector, where we want to load a bunch
> > of progs, pin them all and after that construct a jump table.
> > 
> > Signed-off-by: Stanislav Fomichev <sdf at google.com>
> > ---
> >  .../bpftool/Documentation/bpftool-prog.rst    | 14 +++-
> >  tools/bpf/bpftool/bash-completion/bpftool     |  4 +-
> >  tools/bpf/bpftool/common.c                    | 31 ++++----
> >  tools/bpf/bpftool/main.h                      |  1 +
> >  tools/bpf/bpftool/prog.c                      | 74 ++++++++++++++-----
> >  5 files changed, 82 insertions(+), 42 deletions(-)
> > 
> > diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
> > index ac4e904b10fb..d943d9b67a1d 100644
> > --- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
> > +++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
> 
> > @@ -24,7 +25,7 @@ MAP COMMANDS
> >  |	**bpftool** **prog dump xlated** *PROG* [{**file** *FILE* | **opcodes** | **visual**}]
> >  |	**bpftool** **prog dump jited**  *PROG* [{**file** *FILE* | **opcodes**}]
> >  |	**bpftool** **prog pin** *PROG* *FILE*
> > -|	**bpftool** **prog load** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
> > +|	**bpftool** **prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
> >  |       **bpftool** **prog attach** *PROG* *ATTACH_TYPE* *MAP*
> >  |       **bpftool** **prog detach** *PROG* *ATTACH_TYPE* *MAP*
> >  |	**bpftool** **prog help**
> > @@ -79,8 +80,13 @@ DESCRIPTION
> >  		  contain a dot character ('.'), which is reserved for future
> >  		  extensions of *bpffs*.
> >  
> > -	**bpftool prog load** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
> > -		  Load bpf program from binary *OBJ* and pin as *FILE*.
> > +	**bpftool prog { load | loadall }** *OBJ* *FILE* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*]
> > +		  Load bpf program(s) from binary *OBJ* and pin as *FILE*.
> > +		  Both **bpftool prog load** and **bpftool prog loadall** load
> > +		  all maps and programs from the *OBJ* and differ only in
> > +		  pinning. **load** pins only the first program from the *OBJ*
> > +		  as *FILE*. **loadall** pins all programs from the *OBJ*
> > +		  under *FILE* directory.
> >  		  **type** is optional, if not specified program type will be
> >  		  inferred from section names.
> >  		  By default bpftool will create new maps as declared in the ELF
> 
> Thanks a lot for all the changes! The series looks really good to me
> now. The last nit I might have is that we could maybe replace "FILE"
> with "PATH" (as it can now be a directory), in the doc an below. No need
> to respin just for this, though.
Agreed, makes sense, will do another respin to address Jakub's comments
anyway. Thanks for a review!

> > @@ -1035,7 +1067,8 @@ static int do_help(int argc, char **argv)
> >  		"       %s %s dump xlated PROG [{ file FILE | opcodes | visual }]\n"
> >  		"       %s %s dump jited  PROG [{ file FILE | opcodes }]\n"
> >  		"       %s %s pin   PROG FILE\n"
> > -		"       %s %s load  OBJ  FILE [type TYPE] [dev NAME] \\\n"
> > +		"       %s %s { load | loadall } OBJ  FILE \\\n"
> > +		"                         [type TYPE] [dev NAME] \\\n"
> >  		"                         [map { idx IDX | name NAME } MAP]\n"
> >  		"       %s %s attach PROG ATTACH_TYPE MAP\n"
> >  		"       %s %s detach PROG ATTACH_TYPE MAP\n"
