Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E0396577
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776756022; cv=none; b=X+0CJp1w+alxuU9qr2GKji5QrQ5/folu36JV5wtfLuXXjRioj1UfqDyBlDayVEVK1EPOHn0XgNIJkTqyab41JTO3SkqoD5Py6/j9jni8MlXUVrRcRfYOYkMqWWne/KpQ7RgGZzqphTgDk4LZxdtQZCsSyLkdY/QL/f9tWE3EEFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776756022; c=relaxed/simple;
	bh=VX4wqdc8fUaNqb2L3axrt9LF0e/WzvYh0gO2EeYHeUQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FGCuSyMi13VhF3CRVwMLUP2FB4jOBJMTKa8f0LbemzTWpf804RapA+46jp/fi3JpfF/6h4kbR+f9Az5V9rHB+8H/9ZrQD+MrSOb59SoikiyRMNWqwb++aXBVpHH1UpM5fQL/G/vYTkeNOXRfYI3xT40DMkW5bMFe1uM7Mcf40zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=imKNXhFw; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="imKNXhFw"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b45cd0bb96so40277315ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776756020; x=1777360820; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=91/4oaAqI5zoOb3jrCgPseC/dJYhauKi+DmlkoNw0/0=;
        b=imKNXhFwefC7GbAn8Azi0YJEraaddflsgO6eya41V5TNp7A8rLx0RY8K1ER/vWmr6u
         0HztT7EfWdX9jeYnmUM3mIwQyTefEFazENlX5i5liT1RVJ1MdjgEc+BBZKJkciiqQjAd
         YZxakuDrHJM5dKas40zCJ8fyYLjNZf9txjEqbZ15FdfcjNc8vpDK2CYFd3QroCaHcgX2
         dojAN9uKTsO4hM2RSqJXCxyJ9wUx3oe7L6mkhFDqbbM2tEARaKB7Em0OwqQWypsd9S0D
         yNNecLlfxVxQwhE+xFimAX1g9T1QEBy0BTo+Cr0I9ElID+GiEmDtk5qzYYtYLieGtuhV
         ohjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756020; x=1777360820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91/4oaAqI5zoOb3jrCgPseC/dJYhauKi+DmlkoNw0/0=;
        b=pnhiyVyEVwghv9xRrNpkG18Fheps4F2LkxrB/JeZtPDo/yl6KiFnAqSQzn5Mzm6Fiy
         7gl4WoWdu6tj7K2v9VkbeOcq3FmzxOLIiyhJb2h2dRcVA7i9NzwT/hyqzY8po2qm7l/h
         iyk4Oo6WrhPZUh2Flz3Bjt/GHXODvWyvZEY9W0L/YSOo4yfD46r6/M9wjbUDEqtVMzIk
         NBtULdGkZe9Mx3P0v0V6/PUkUGdrgSq6OnfLLmv9miAelme1elVy7dbw/JkETElxB7Jg
         AfhZ8fKxvTukXpM/auC9w79oKl/h0hfeESecjixQHvxr0aImAcF8h75NytMI31DmJSCZ
         Z+VA==
X-Forwarded-Encrypted: i=1; AFNElJ/4n43LcXIt2YpJxh82HJknngZsrYQoA12SbYEkxzbVohsScq7SruwfZPPBQq2KHPkso4EVKnJNrdLsiz/s/xo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq6/o2+73lSSid7aNGY5SKpDMZw7BFlCcqHjqR00Vm2lOW20t3
	FFztLj3zMDGhmgESiXcx9KILmmoN2CCYHNvPQb6j1XuxiuytiLYNoGmfyQwrqhEJAkpbGK38ACa
	8c+TF8Q==
X-Received: from plbx11.prod.google.com ([2002:a17:902:ea8b:b0:2b0:6314:419b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db0d:b0:2b2:4fe3:7b89
 with SMTP id d9443c01a7336-2b5f9f52879mr163499125ad.38.1776756019292; Tue, 21
 Apr 2026 00:20:19 -0700 (PDT)
Date: Tue, 21 Apr 2026 07:15:09 +0000
In-Reply-To: <20260418181333.1713389-3-jt26wzz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260418181333.1713389-3-jt26wzz@gmail.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421072017.1653163-1-kuniyu@google.com>
Subject: Re: [PATCH net v2 2/2] selftests/bpf: check epoll readiness after
 reuseport migration
From: Kuniyuki Iwashima <kuniyu@google.com>
To: jt26wzz@gmail.com
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	ncardwell@google.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	shuah@kernel.org, tamird@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Zhenzhong Wu <jt26wzz@gmail.com>
Date: Sun, 19 Apr 2026 02:13:33 +0800
> After migrate_dance() moves established children to the target
> listener, add it to an epoll set and verify that epoll_wait(..., 0)
> reports it ready before accept().
> 
> This adds epoll coverage for the TCP_ESTABLISHED reuseport migration
> case in migrate_reuseport.
> 
> Keep the check limited to TCP_ESTABLISHED cases. TCP_SYN_RECV and
> TCP_NEW_SYN_RECV still depend on asynchronous handshake completion,
> so a zero-timeout epoll_wait() would race there.
> 
> Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> ---
>  .../bpf/prog_tests/migrate_reuseport.c        | 32 ++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> index 653b0a20f..580a53424 100644
> --- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> +++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
> @@ -18,13 +18,16 @@
>   *   9. call shutdown() for the second server
>   *        and migrate the requests in the accept queue
>   *        to the last server socket.
> - *  10. call accept() for the last server socket.
> + *  10. for TCP_ESTABLISHED cases, call epoll_wait(..., 0)
> + *        for the last server socket.
> + *  11. call accept() for the last server socket.
>   *
>   * Author: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
>   */
>  
>  #include <bpf/bpf.h>
>  #include <bpf/libbpf.h>
> +#include <sys/epoll.h>
>  
>  #include "test_progs.h"
>  #include "test_migrate_reuseport.skel.h"
> @@ -522,6 +525,33 @@ static void run_test(struct migrate_reuseport_test_case *test_case,
>  			goto close_clients;
>  	}
>  
> +	/* Only TCP_ESTABLISHED has already-migrated accept-queue entries
> +	 * here.  Later states still depend on follow-up handshake work.
> +	 */
> +	if (test_case->state == BPF_TCP_ESTABLISHED) {
> +		struct epoll_event ev = {
> +			.events = EPOLLIN,
> +		};
> +		int epfd;
> +		int nfds;
> +
> +		epfd = epoll_create1(EPOLL_CLOEXEC);
> +		if (!ASSERT_NEQ(epfd, -1, "epoll_create1"))
> +			goto close_clients;
> +
> +		ev.data.fd = test_case->servers[MIGRATED_TO];
> +		if (!ASSERT_OK(epoll_ctl(epfd, EPOLL_CTL_ADD,
> +					 test_case->servers[MIGRATED_TO], &ev),
> +			       "epoll_ctl"))
> +			goto close_epfd;
> +
> +		nfds = epoll_wait(epfd, &ev, 1, 0);
> +		ASSERT_EQ(nfds, 1, "epoll_wait");

Thanks for the update, but the test passes without patch 1.

I think it would be best to test just after shutdown()
where migration happens.

Also, TCP_SYN_RECV should be covered in the same way.

---8<---
diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
index 580a534249a7..66fea936649e 100644
--- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
+++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
@@ -353,8 +353,29 @@ static int update_maps(struct migrate_reuseport_test_case *test_case,
 
 static int migrate_dance(struct migrate_reuseport_test_case *test_case)
 {
+	struct epoll_event ev = {
+		.events = EPOLLIN,
+	};
+	int epoll, nfds;
 	int i, err;
 
+	if (test_case->state != BPF_TCP_NEW_SYN_RECV) {
+		epoll = epoll_create1(0);
+		if (!ASSERT_NEQ(epoll, -1, "epoll_create1"))
+			return -1;
+
+		ev.data.fd = test_case->servers[MIGRATED_TO];
+		if (!ASSERT_OK(epoll_ctl(epoll, EPOLL_CTL_ADD,
+					 test_case->servers[MIGRATED_TO], &ev),
+			       "epoll_ctl")) {
+			goto close_epoll;
+		}
+
+		nfds = epoll_wait(epoll, &ev, 1, 0);
+		if (!ASSERT_EQ(nfds, 0, "epoll_wait 1"))
+			goto close_epoll;
+	}
+
 	/* Migrate TCP_ESTABLISHED and TCP_SYN_RECV requests
 	 * to the last listener based on eBPF.
 	 */
@@ -368,6 +389,15 @@ static int migrate_dance(struct migrate_reuseport_test_case *test_case)
 	if (test_case->state == BPF_TCP_NEW_SYN_RECV)
 		return 0;
 
+	nfds = epoll_wait(epoll, &ev, 1, 0);
+	if (!ASSERT_EQ(nfds, 1, "epoll_wait 2")) {
+close_epoll:
+		close(epoll);
+		return -1;
+	}
+
+	close(epoll);
+
 	/* Note that we use the second listener instead of the
 	 * first one here.
 	 *
@@ -525,33 +555,6 @@ static void run_test(struct migrate_reuseport_test_case *test_case,
 			goto close_clients;
 	}
 
-	/* Only TCP_ESTABLISHED has already-migrated accept-queue entries
-	 * here.  Later states still depend on follow-up handshake work.
-	 */
-	if (test_case->state == BPF_TCP_ESTABLISHED) {
-		struct epoll_event ev = {
-			.events = EPOLLIN,
-		};
-		int epfd;
-		int nfds;
-
-		epfd = epoll_create1(EPOLL_CLOEXEC);
-		if (!ASSERT_NEQ(epfd, -1, "epoll_create1"))
-			goto close_clients;
-
-		ev.data.fd = test_case->servers[MIGRATED_TO];
-		if (!ASSERT_OK(epoll_ctl(epfd, EPOLL_CTL_ADD,
-					 test_case->servers[MIGRATED_TO], &ev),
-			       "epoll_ctl"))
-			goto close_epfd;
-
-		nfds = epoll_wait(epfd, &ev, 1, 0);
-		ASSERT_EQ(nfds, 1, "epoll_wait");
-
-close_epfd:
-		close(epfd);
-	}
-
 	count_requests(test_case, skel);
 
 close_clients:
---8<---
