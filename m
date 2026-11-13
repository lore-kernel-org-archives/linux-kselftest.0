Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577866;
	b=k7HN/j9ZLg3ZjAxot/NfvZ4IrPIw8Oefv4mj7VmIZUREAJ6gxcsvU1GEgRbqgXMs0A5z
	 +sgVpCpiFLrjqyhG41dITMJxTqeSk1YNrFZfiMRmqfu/oUQJV0VhMK5UlscO3DzBwYwfd
	 gLYrSQG0d+iSQmD6kANA93y0IyVwiZ/EA33QHqxomwNRyfwOputVtKBx7GOdwVFYgW6iW
	 b1yRsTjwm/L89WvnOP5jxz65FQEZsbwIBHs6/xaJy9ABuutR14VAWu2bcAd7cxWzzjSnP
	 cvHKnuqpUpa7s5eIM0Pb9XF3ykLxXVAqJJNEh2T9RE97vI/MctDy3k+v11wbv6RQyDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kXcht9P+JlFAWDjvNBwE3nXsYUOs8z+TyJ2+cP3q9Yw=;
	b=GyEjp3v/oTkfDbU1ywaZo7/H/cMqtwP5uA8imvk2OU9jYPs5A/V6mZOGEK3WztBxaite
	 x/63kuvReo2NG4alsTUwTZF7TQzqfgHb7yqHXnbB0kN/WzCK6khfWqP98fRZajwaHrq0O
	 EPg6IWdf1uI08FkhpM7cEvLmZdNuuxDz2V6c2I10v5HeqTDOngzUuML6jx5nVl6wl9AK9
	 xldIzNg4lol5cIID/jdP/JzlAa8V2WJflJwYIpUTjc6dNKXFrojxFTIaFqLpH6jILZ2Lr
	 9BDjCZ/S99jm6egi2rM+9ctNWwEXguW5Cvjw12zoPGZiaelXMBq0eB+cs/XWyhS0Cww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=omzjmy47;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF9B606A331
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 13:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF9B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=omzjmy47
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb8e8bccdeso520231a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 05:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577865; x=1795182665; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXcht9P+JlFAWDjvNBwE3nXsYUOs8z+TyJ2+cP3q9Yw=;
        b=omzjmy47L2fSY2Y5fdXegm4426L+6ApFXYiWB6LN1Mc5oWkRVfyCO6E2LgqN9lQ7dL
         HI1q44cMbtFmX//vHoaDda0vaS6GzVkzcfgAyyv04Lim/nb8G8/nDgjF/u3urE+g3G5+
         ym63ZUYL3nHosUBKGwMw0gWSJ+fIOhWRwfOSSeNcz832T0OB5usjffeRL3HZd8oLnFE7
         Hajg1uoCmFMoN5Jg3TPtuCkH7PNd3+9gFHreuhCCRJ0u2CMtGswQpABzbPlJSIZtFVFp
         y/mBBMgT6z2Jf0yjOlxEAfDVeTs0aVY9li8mGbltauIjwQB/o/KA+tIQV9TizZPHveeu
         bUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577865; x=1795182665;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXcht9P+JlFAWDjvNBwE3nXsYUOs8z+TyJ2+cP3q9Yw=;
        b=nFhsSGGLy/7TF2ohLFwSm0BWOhSVnm6QKiTRNb9wmpIdYqXAzsl+v5PNi6fQ2k75oq
         rmXbVf+sSOsQFObRq+ehsQu36weN7nXYt3zVhyQTcs8m6nFBlydyyfZxdItJbawbcpEw
         Egp+edOF7kuMMgv+SKKG9Aw3FUbE5IwK1+8rc1u/DphvX2xBYBby1juiy6HO71Mv7TeO
         s76s/2m699tPVAtTVQvqxTUzVxaf4BC9Wh+l2cJw+qT9nUcq2vs48LWuFG4oGHC58hpx
         Om+mJy35lW91ZDv4nlYxO+McH1ESHnRBS78wbjJVNwIiHPNtPsa+4eyylOQQog+KlPUZ
         /fmQ==
X-Forwarded-Encrypted: i=1; AL+hErGOt3jzBtob9Trbnux4m4Pwz3O6ApjuSO5CQo31l31SohtcFzOh8Aed5OejmIpziqbD07iOeSTMUlNFAu6xmjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BZZmDeHTKigwFLn5hqsf9/E8EOsMaI6TnhqfFsd9lzZuOoHV5
	BX1EL/xhGwiW+ZNYXzrD5ZqRIuYuKlscCjkXvemvK/lu9NPoDFerrhaaoGlaUDG/huSgCxZUtEs
	NWv2ngg==
X-Received: from pjbqd6.prod.google.com ([2002:a17:90b:3cc6:b0:3b0:979d:e867])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5906:b0:3b0:934c:5e41
 with SMTP id 98e67ed59e1d1-3b1b0b4acecmr2199158a91.29.1794577864940; Fri, 13
 Nov 2026 05:51:04 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:06 -0800
In-Reply-To: <eef6bc34bdf7391c5d3eb4b1ba5e97819e22ae8f.1791542392.git.priyankamani2100@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <eef6bc34bdf7391c5d3eb4b1ba5e97819e22ae8f.1791542392.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441834884.81867.15216676468170040644.b4-ty@b4>
Subject: Re: [PATCH] KVM: selftests: Fix ndata size check in test_mmio_during_vectoring
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Priyanka Mani <priyankamani2100@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Ivan Orlov <iorlov@amazon.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 09 Oct 2026 11:30:17 +0000, Priyanka Mani wrote:
> test_mmio_during_vectoring() verifies that KVM reports the faulting GPA in
> run->internal.data[3] when an emulated MMIO access occurs during event
> vectoring.  kvm_prepare_event_vectoring_exit() always fills five entries
> (info2, reason, info1, gpa, last_vmentry_cpu), i.e. internal.ndata is 5.
> 
> The test, however, checks "ndata != 4" before dereferencing data[3].  That
> predicate does not actually validate the array size: it passes for ndata ==
> 3, where data[3] is out of bounds yet is read just below, and it spuriously
> fails if ndata were ever exactly 4.  It only happens to work today because
> KVM returns 5.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix ndata size check in test_mmio_during_vectoring
      https://github.com/kvm-x86/linux/commit/509f344f9480

--
https://github.com/kvm-x86/linux/tree/next
