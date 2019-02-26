From: sboyd at kernel.org (Stephen Boyd)
Date: Tue, 26 Feb 2019 12:35:45 -0800
Subject: [RFC v4 08/17] kunit: test: add support for test abort
In-Reply-To: <20190214213729.21702-9-brendanhiggins@google.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <20190214213729.21702-9-brendanhiggins@google.com>
Message-ID: <155121334527.260864.5324117081460979741@swboyd.mtv.corp.google.com>

Quoting Brendan Higgins (2019-02-14 13:37:20)
> Add support for aborting/bailing out of test cases. Needed for
> implementing assertions.

Can you add some more text here with the motivating reasons for
implementing assertions and bailing out of test cases?

For example, I wonder why unit tests can't just return with a failure
when they need to abort and then the test runner would detect that error
via the return value from the 'run test' function. That would be a more
direct approach, but also more verbose than a single KUNIT_ASSERT()
line. It would be more kernel idiomatic too because the control flow
isn't hidden inside a macro and it isn't intimately connected with
kthreads and completions.

> 
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
[...]
> diff --git a/kunit/test-test.c b/kunit/test-test.c
> new file mode 100644
> index 0000000000000..a936c041f1c8f

Could this whole file be another patch? It seems to be a test for the
try catch mechanism.

> diff --git a/kunit/test.c b/kunit/test.c
> index d18c50d5ed671..6e5244642ab07 100644
> --- a/kunit/test.c
> +++ b/kunit/test.c
[...]
> +
> +static void kunit_generic_throw(struct kunit_try_catch *try_catch)
> +{
> +       try_catch->context.try_result = -EFAULT;
> +       complete_and_exit(try_catch->context.try_completion, -EFAULT);
> +}
> +
> +static int kunit_generic_run_threadfn_adapter(void *data)
> +{
> +       struct kunit_try_catch *try_catch = data;
>  
> +       try_catch->try(&try_catch->context);
> +
> +       complete_and_exit(try_catch->context.try_completion, 0);

The exit code doesn't matter, right? If so, it might be clearer to just
return 0 from this function because kthreads exit themselves as far as I
recall.

> +}
> +
> +static void kunit_generic_run_try_catch(struct kunit_try_catch *try_catch)
> +{
> +       struct task_struct *task_struct;
> +       struct kunit *test = try_catch->context.test;
> +       int exit_code, wake_result;
> +       DECLARE_COMPLETION(test_case_completion);

DECLARE_COMPLETION_ONSTACK()?

> +
> +       try_catch->context.try_completion = &test_case_completion;
> +       try_catch->context.try_result = 0;
> +       task_struct = kthread_create(kunit_generic_run_threadfn_adapter,
> +                                            try_catch,
> +                                            "kunit_try_catch_thread");
> +       if (IS_ERR_OR_NULL(task_struct)) {

It looks like NULL is never returned from kthread_create(), so don't
check for it here.

> +               try_catch->catch(&try_catch->context);
> +               return;
> +       }
> +
> +       wake_result = wake_up_process(task_struct);
> +       if (wake_result != 0 && wake_result != 1) {

These are the only two possible return values of wake_up_process(), so
why not just use kthread_run() and check for an error on the process
creation?

> +               kunit_err(test, "task was not woken properly: %d", wake_result);
> +               try_catch->catch(&try_catch->context);
> +       }
> +
> +       /*
> +        * TODO(brendanhiggins at google.com): We should probably have some type of
> +        * timeout here. The only question is what that timeout value should be.
> +        *
> +        * The intention has always been, at some point, to be able to label
> +        * tests with some type of size bucket (unit/small, integration/medium,
> +        * large/system/end-to-end, etc), where each size bucket would get a
> +        * default timeout value kind of like what Bazel does:
> +        * https://docs.bazel.build/versions/master/be/common-definitions.html#test.size
> +        * There is still some debate to be had on exactly how we do this. (For
> +        * one, we probably want to have some sort of test runner level
> +        * timeout.)
> +        *
> +        * For more background on this topic, see:
> +        * https://mike-bland.com/2011/11/01/small-medium-large.html
> +        */
> +       wait_for_completion(&test_case_completion);

It doesn't seem like a bad idea to make this have some arbitrarily large
timeout value to start with. Just to make sure the whole thing doesn't
get wedged. It's a timeout, so in theory it should never trigger if it's
large enough.

> +
> +       exit_code = try_catch->context.try_result;
> +       if (exit_code == -EFAULT)
> +               try_catch->catch(&try_catch->context);
> +       else if (exit_code == -EINTR)
> +               kunit_err(test, "wake_up_process() was never called.");

Does kunit_err() add newlines? It would be good to stick to the rest of
kernel style (printk, tracing, etc.) and rely on the callers to have the
newlines they want. Also, remove the full-stop because it isn't really
necessary to have those in error logs.

> +       else if (exit_code)
> +               kunit_err(test, "Unknown error: %d", exit_code);
> +}
> +
> +void kunit_generic_try_catch_init(struct kunit_try_catch *try_catch)
> +{
> +       try_catch->run = kunit_generic_run_try_catch;

Is the idea that 'run' would be anything besides
'kunit_generic_run_try_catch'? If it isn't going to be different, then
maybe it's simpler to just have a function like
kunit_generic_run_try_catch() that is called by the unit tests instead
of having to write 'try_catch->run(try_catch)' and indirect for the
basic case. Maybe I've missed the point entirely though and this is all
scaffolding for more complicated exception handling later on.

> +       try_catch->throw = kunit_generic_throw;
> +}
> +
> +void __weak kunit_try_catch_init(struct kunit_try_catch *try_catch)
> +{
> +       kunit_generic_try_catch_init(try_catch);
> +}
> +
> +static void kunit_try_run_case(struct kunit_try_catch_context *context)
> +{
> +       struct kunit_try_catch_context *ctx = context;
> +       struct kunit *test = ctx->test;
> +       struct kunit_module *module = ctx->module;
> +       struct kunit_case *test_case = ctx->test_case;
> +
> +       /*
> +        * kunit_run_case_internal may encounter a fatal error; if it does, we
> +        * will jump to ENTER_HANDLER above instead of continuing normal control

Where is 'ENTER_HANDLER' above?

> +        * flow.
> +        */
>         kunit_run_case_internal(test, module, test_case);
> +       /* This line may never be reached. */
>         kunit_run_case_cleanup(test, module, test_case);
> +}
