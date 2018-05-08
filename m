From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Tue, 8 May 2018 12:29:09 +0900
Subject: [PATCH 09/24] selftests: ftrace: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180507111721.7f8a6b35@gandalf.local.home>
References: <20180505011328.32078-1-shuah@kernel.org>
 <20180505011328.32078-9-shuah@kernel.org>
 <20180507111721.7f8a6b35@gandalf.local.home>
Message-ID: <20180508122909.e64612790be5a62cefbf1476@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508032909.gng9CbyVyksDFh451z6TEPnDJXZThalpw5JuDSO8Lwk@z>

On Mon, 7 May 2018 11:17:21 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri,  4 May 2018 19:13:13 -0600
> "Shuah Khan (Samsung OSG)" <shuah@kernel.org> wrote:
> 
> > When ftrace test is skipped because of unmet dependencies and/or
> > unsupported configuration, it returns 0 which is treated as a pass
> > by the Kselftest framework. This leads to false positive result even
> > when the test could not be run.
> > 
> > Change it to return kselftest skip code when a test gets skipped to
> > clearly report that the test could not be run.
> > 
> > Kselftest framework SKIP code is 4 and the framework prints appropriate
> > messages to indicate that the test is skipped.
> > 
> 
> I'm fine with this change, but I believe Masami and perhaps others
> have scripts that expect zero return.

Oh, I'm happy with updating my script to follow the kselftest
framework spec, since that is the standard.

Shuah, is there any document which describe the return code for
kselftest framework? (And I think it should report some FAIL/PASS counts
to kselftest

However, this patch seems not working as you expected.
If kselftest framework would like to get the SKIP code from ftrace script,
you need to update TOTAL_RESULT before leave.

> If anything, we probably need to have a way to override the ksft_skip
> via a command line argument.
> 
> Masami?

Agreed. Maybe we can pass the option via an environment variable.

Thanks,

> 
> -- Steve
> 
> > Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
> > ---
> >  tools/testing/selftests/ftrace/ftracetest | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
> > index f9a9d424c980..b731c8cdcffb 100755
> > --- a/tools/testing/selftests/ftrace/ftracetest
> > +++ b/tools/testing/selftests/ftrace/ftracetest
> > @@ -23,6 +23,9 @@ echo "		            If <dir> is -, all logs output in console only"
> >  exit $1
> >  }
> >  
> > +# Kselftest framework requirement - SKIP code is 4.
> > +ksft_skip=4
> > +
> >  errexit() { # message
> >    echo "Error: $1" 1>&2
> >    exit 1
> > @@ -30,7 +33,8 @@ errexit() { # message
> >  
> >  # Ensuring user privilege
> >  if [ `id -u` -ne 0 ]; then
> > -  errexit "this must be run by root user"
> > +  echo "Skipping: test must be run by root user"
> > +  exit $ksft_skip
> >  fi
> >  
> >  # Utilities
> > @@ -249,7 +253,7 @@ trap 'SIG_RESULT=$UNTESTED' $SIG_UNTESTED
> >  SIG_UNSUPPORTED=$((SIG_BASE + UNSUPPORTED))
> >  exit_unsupported () {
> >    kill -s $SIG_UNSUPPORTED $SIG_PID
> > -  exit 0
> > +  exit $ksft_skip
> >  }
> >  trap 'SIG_RESULT=$UNSUPPORTED' $SIG_UNSUPPORTED
> >  
> 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
