From: masami.hiramatsu@gmail.com (Masami Hiramatsu)
Date: Wed, 17 Oct 2018 10:03:05 +0900
Subject: [PATCH] selftests/ftrace: Use colored output when available
In-Reply-To: <20181016130956.2be3b984@gandalf.local.home>
References: <20181016170220.31156-1-daniel.diaz@linaro.org>
 <20181016130956.2be3b984@gandalf.local.home>
Message-ID: <20181017100305.0b3c03461b098f8943805455@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017010305.bv6rtXf0eN9VHfjNLYCBI5IEVAQprGOc-aqnczLVotQ@z>

On Tue, 16 Oct 2018 13:09:56 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> 
> Masami,
> 
> Does this fix the issues you reported?

Yes, a half. We still need to strip out the escape sequences from
log file even if the terminal accepts colors.
Anyway, this fixes the "black character" issue for me :)

Thanks Daniel!

Acked-by: Masami Hiramatsu <mhiramat at kernel.org>

I'll add a filter patch on top of this.

Thank you,

> 
> -- Steve
> 
> On Tue, 16 Oct 2018 12:02:20 -0500
> Daniel Díaz <daniel.diaz@linaro.org> wrote:
> 
> > If test is being directly executed (with stdout opened on the
> > terminal) and the terminal capabilities indicate enough
> > colors, then use the existing scheme of green, red, and blue
> > to show when tests pass, fail or end in a different way.
> > 
> > When running the tests redirecting the stdout, for instance,
> > to a file, then colors are not shown, thus producing a more
> > readable output.
> > 
> > Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> > ---
> >  tools/testing/selftests/ftrace/ftracetest | 29 +++++++++++++++++------
> >  1 file changed, 22 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
> > index 4946b2edfcff..d987bbec675f 100755
> > --- a/tools/testing/selftests/ftrace/ftracetest
> > +++ b/tools/testing/selftests/ftrace/ftracetest
> > @@ -152,6 +152,21 @@ else
> >    date > $LOG_FILE
> >  fi
> >  
> > +# Define text colors
> > +# Check available colors on the terminal, if any
> > +ncolors=`tput colors 2>/dev/null`
> > +color_reset=
> > +color_red=
> > +color_green=
> > +color_blue=
> > +# If stdout exists and number of colors is eight or more, use them
> > +if [ -t 1 -a "$ncolors" -a "$ncolors" -ge 8 ]; then
> > +  color_reset="\e[0m"
> > +  color_red="\e[31m"
> > +  color_green="\e[32m"
> > +  color_blue="\e[34m"
> > +fi
> > +
> >  prlog() { # messages
> >    [ -z "$LOG_FILE" ] && echo -e "$@" || echo -e "$@" | tee -a $LOG_FILE
> >  }
> > @@ -195,37 +210,37 @@ test_on_instance() { # testfile
> >  eval_result() { # sigval
> >    case $1 in
> >      $PASS)
> > -      prlog "	[\e[32mPASS\e[30m]"
> > +      prlog "	[${color_green}PASS${color_reset}]"
> >        PASSED_CASES="$PASSED_CASES $CASENO"
> >        return 0
> >      ;;
> >      $FAIL)
> > -      prlog "	[\e[31mFAIL\e[30m]"
> > +      prlog "	[${color_red}FAIL${color_reset}]"
> >        FAILED_CASES="$FAILED_CASES $CASENO"
> >        return 1 # this is a bug.
> >      ;;
> >      $UNRESOLVED)
> > -      prlog "	[\e[34mUNRESOLVED\e[30m]"
> > +      prlog "	[${color_blue}UNRESOLVED${color_reset}]"
> >        UNRESOLVED_CASES="$UNRESOLVED_CASES $CASENO"
> >        return 1 # this is a kind of bug.. something happened.
> >      ;;
> >      $UNTESTED)
> > -      prlog "	[\e[34mUNTESTED\e[30m]"
> > +      prlog "	[${color_blue}UNTESTED${color_reset}]"
> >        UNTESTED_CASES="$UNTESTED_CASES $CASENO"
> >        return 0
> >      ;;
> >      $UNSUPPORTED)
> > -      prlog "	[\e[34mUNSUPPORTED\e[30m]"
> > +      prlog "	[${color_blue}UNSUPPORTED${color_reset}]"
> >        UNSUPPORTED_CASES="$UNSUPPORTED_CASES $CASENO"
> >        return $UNSUPPORTED_RESULT # depends on use case
> >      ;;
> >      $XFAIL)
> > -      prlog "	[\e[31mXFAIL\e[30m]"
> > +      prlog "	[${color_red}XFAIL${color_reset}]"
> >        XFAILED_CASES="$XFAILED_CASES $CASENO"
> >        return 0
> >      ;;
> >      *)
> > -      prlog "	[\e[34mUNDEFINED\e[30m]"
> > +      prlog "	[${color_blue}UNDEFINED${color_reset}]"
> >        UNDEFINED_CASES="$UNDEFINED_CASES $CASENO"
> >        return 1 # this must be a test bug
> >      ;;
> 


-- 
Masami Hiramatsu
