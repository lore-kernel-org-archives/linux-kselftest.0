From: keescook at chromium.org (Kees Cook)
Date: Wed, 24 Apr 2019 09:37:56 -0700
Subject: [PATCH 2/2] seccomp: Make NEW_LISTENER and TSYNC flags exclusive
In-Reply-To: <20190424163756.40001-1-keescook@chromium.org>
References: <20190424163756.40001-1-keescook@chromium.org>
Message-ID: <20190424163756.40001-3-keescook@chromium.org>

From: Tycho Andersen <tycho at tycho.ws>

As the comment notes, the return codes for TSYNC and NEW_LISTENER
conflict, because they both return positive values, one in the case of
success and one in the case of error. So, let's disallow both of these
flags together.

While this is technically a userspace break, all the users I know
of are still waiting on me to land this feature in libseccomp, so I
think it'll be safe. Also, at present my use case doesn't require
TSYNC at all, so this isn't a big deal to disallow. If someone
wanted to support this, a path forward would be to add a new flag like
TSYNC_AND_LISTENER_YES_I_UNDERSTAND_THAT_TSYNC_WILL_JUST_RETURN_EAGAIN,
but the use cases are so different I don't see it really happening.

Finally, it's worth noting that this does actually fix a UAF issue: at the
end of seccomp_set_mode_filter(), we have:

        if (flags & SECCOMP_FILTER_FLAG_NEW_LISTENER) {
                if (ret < 0) {
                        listener_f->private_data = NULL;
                        fput(listener_f);
                        put_unused_fd(listener);
                } else {
                        fd_install(listener, listener_f);
                        ret = listener;
                }
        }
out_free:
        seccomp_filter_free(prepared);

But if ret > 0 because TSYNC raced, we'll install the listener fd and then
free the filter out from underneath it, causing a UAF when the task closes
it or dies. This patch also switches the condition to be simply if (ret),
so that if someone does add the flag mentioned above, they won't have to
remember to fix this too.

Reported-by: syzbot+b562969adb2e04af3442 at syzkaller.appspotmail.com
Fixes: 6a21cc50f0c7 ("seccomp: add a return code to trap to userspace")
CC: stable at vger.kernel.org # v5.0+
Signed-off-by: Tycho Andersen <tycho at tycho.ws>
Signed-off-by: Kees Cook <keescook at chromium.org>
---
 kernel/seccomp.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index df27e499956a..3582eeb59893 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -502,7 +502,10 @@ seccomp_prepare_user_filter(const char __user *user_filter)
  *
  * Caller must be holding current->sighand->siglock lock.
  *
- * Returns 0 on success, -ve on error.
+ * Returns 0 on success, -ve on error, or
+ *   - in TSYNC mode: the pid of a thread which was either not in the correct
+ *     seccomp mode or did not have an ancestral seccomp filter
+ *   - in NEW_LISTENER mode: the fd of the new listener
  */
 static long seccomp_attach_filter(unsigned int flags,
 				  struct seccomp_filter *filter)
@@ -1258,6 +1261,16 @@ static long seccomp_set_mode_filter(unsigned int flags,
 	if (flags & ~SECCOMP_FILTER_FLAG_MASK)
 		return -EINVAL;
 
+	/*
+	 * In the successful case, NEW_LISTENER returns the new listener fd.
+	 * But in the failure case, TSYNC returns the thread that died. If you
+	 * combine these two flags, there's no way to tell whether something
+	 * succeeded or failed. So, let's disallow this combination.
+	 */
+	if ((flags & SECCOMP_FILTER_FLAG_TSYNC) &&
+	    (flags & SECCOMP_FILTER_FLAG_NEW_LISTENER))
+		return -EINVAL;
+
 	/* Prepare the new filter before holding any locks. */
 	prepared = seccomp_prepare_user_filter(filter);
 	if (IS_ERR(prepared))
@@ -1304,7 +1317,7 @@ static long seccomp_set_mode_filter(unsigned int flags,
 		mutex_unlock(&current->signal->cred_guard_mutex);
 out_put_fd:
 	if (flags & SECCOMP_FILTER_FLAG_NEW_LISTENER) {
-		if (ret < 0) {
+		if (ret) {
 			listener_f->private_data = NULL;
 			fput(listener_f);
 			put_unused_fd(listener);
-- 
2.17.1
