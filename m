Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115996;
	b=Z1FPypApFXjONbiu2aFmMiE2kvDW33tCWSrOFYZtEgplkUCCxdqNJm2/VVUvhXq/ykY2
	 vcgc7s46JEw1DLwi/m6XvmXnOxa2bUkd5M4q0dorCYPriL0uJfEBa2nQQfQ3QsncNbTqj
	 Ug7zV+g5mu9O6lw2atw5/VQOh8vFrScPZq1pkoYA1IK9GaQ4x11biN+zQ21IJ8PY+YD0a
	 BrtTyWu4EQCkNRcg2fMViCTZR7zeMhQF2DHTUEIdMXUODvW2COCTiHUenyB+cWikm7AjB
	 jBUuWIuXHz8SgDU+lHZNpavQW6i5LEWNrGAybU1AaRQJmOT022jvfWONBLXzYkl2KEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=B3fPYwtnhJtRTzUId1FsxU5BbcK59iDRRgRTHG4g8TM=;
	b=q6njR4G05TRYMdGeZgpybXYVnRlBcgOcy6IZQBVtZHLny+9EAC+O27CHG5tI4cFheIiR
	 YAjN99N6PDnbg/C+j2Vd6BGWRaQgMSRHhi8ACP0MfSgrT8iN7W8y8Bu3UTma+hWGMR9YQ
	 FHGub+3KpAEcsM+8b/QjXRtRLhHnw4R7WfqnKhy+6dODhOroW82fJ59Ig9QPshQyNUkL6
	 2K+Tz015ZYFhP144b6AyxMbc0uLHZGBSZaNwfp2DFmA1h9IY1AU48b6dklP/mJzkdJngN
	 6x6Ihc7AKW5V6d76uHDRF9G15+XkB45xziO4YmjLxZ5pyxrklEu9/NkE6nzJ9yduB/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e6cswkqt;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898EB606A324
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 19:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 898EB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e6cswkqt
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c49b95262a5so7695066b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795115995; x=1795720795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3fPYwtnhJtRTzUId1FsxU5BbcK59iDRRgRTHG4g8TM=;
        b=e6cswkqtbr5gIXT7zPqwbxbqDazMSGSQh5brqg3woxMXmbrKcsjWeeblJDpIszQpxv
         TGd/0ALnpNpnRp60nZIXkRb+MGUi4YpzELfsgyKbr4pDwt9UXKuQxAM8wTMa71F87J3J
         YYQ7BIp9fnmNRMjQDqTpqrghxE77fiw7x7nGb+4Wy9iKCcQm8Xc//n2/a/t+2OZIFVuz
         vY5oy9BS16JZ7A7CoPwlDpw7vJHOvZMFy7JAayuM8duhreLgQWZdUtjMkjojacGMmAPo
         XWy8bVfUa3GEHukBLrYA+VA8kAgfdKRZvXiR9bpIv8Lbshi6/T1qWH0+rQhWll7dwZeB
         FMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115995; x=1795720795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3fPYwtnhJtRTzUId1FsxU5BbcK59iDRRgRTHG4g8TM=;
        b=ULrXEVKIm1MBMaxNNGW/WfK+dOG1Ym3aenf5u2ij/ZmHRnYwWLgIlRf5dWueUqOoNa
         yQzfiSXmJl/0kCd/yHZNbfExI5zHtWTudMbYSLPFBHZTGGYx/pz2g4XpKaVhZqtQsIlo
         7lBwlRjjKSY8XIp4gGWkQdi44YWSf0LGYZnthcKBOv8qFK23hTh2l71sGqGHNDGIXqfQ
         BLxvyTRntFbaTGWvhlC+IC3yIolVCFc9WavxhctUgYPHhdofS+SSNVh1JOfrpDa+POqS
         CPeAFI32souyy/qbpWrnEehA5ngPBbR0crBkGazruF8bTrjyajpra+v302cjmM8QHjKV
         TTDQ==
X-Forwarded-Encrypted: i=1; AL+hErGeggIPBTdsgrlyKAbJ1rp1fo1ubTrYQwILWhg3IhHHBW8JhyCBjNFu+shJc4WcfqwyI0MLzb8iJReVS2/nZ7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g0MIvQu53D/mhmXW71whD+sJ1kzmT4iuaMwWpIfGYff6+lK/s
	dTr82MjxJ7PmNPTpf72y1XwZUETtCzCqxso9FsrjU7VMf3m1XuxoF1ApPnKTI864Ne8vJXrzvw=
	=
X-Received: from ejbgt15.prod.google.com ([2002:a17:906:f20f:b0:c2e:1bc5:6c6c])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:9fd0:b0:c50:a2f1:f200
 with SMTP id a640c23a62f3a-c513a5da8e7mr99034666b.16.1795115994327; Thu, 19
 Nov 2026 11:19:54 -0800 (PST)
Date: Thu, 19 Nov 2026 19:19:53 +0000
In-Reply-To: <av8QNiFcnGWocORy@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119104208.782900-1-halg@google.com> <20261119104208.782900-2-halg@google.com>
 <av8QNiFcnGWocORy@kernel.org>
Message-ID: <av9L2ez51erKkQNo@google.com>
Subject: Re: [PATCH v2 1/4] userns: introduce capability bounding set for user namespaces
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Serge Hallyn <sergeh@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	David Howells <dhowells@redhat.com>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Jonathan Calmels <jcalmels@3xx0.net>, Jann Horn <jannh@google.com>, 
	"=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, keyrings@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 19, 2026 at 05:05:26PM +0200, Jarkko Sakkinen wrote:
> On Thu, Nov 19, 2026 at 10:42:05AM +0000, Hallgrimur H. Gunnarsson wrote:
> >  static void set_cred_user_ns(struct cred *cred, struct user_namespace *user_ns)
> 
> I read the diff through but this led me to dead end. Cannot find this
> function from anywhere. I look the changes again once this is sorted
> out becaus this is interesting.
> 
> I wanted to look at the call site to understand how cap_bset gets set,
> which is not now possible but I do get the gist and agree with it.

Thanks for taking a look. The series is based on v7.4-rc1 and
set_cred_user_ns() lives in kernel/user_namespace.c, where it is called
from create_user_ns() and userns_install(). ns->cap_bset itself is
initialized in create_user_ns() right before calling set_cred_user_ns().

> I'd figure getting this relates to my rootns patches (perhas). One key
> mechanism for me resolving the unprivileged in my use case is
> MOVE_MOUNT_T_MNTNS [1], which is orthogonal but just pointing out
> the problem space.

From a quick look, they appear complementary. Being able to do more
setup operations from the outside generally aligns with bounding
capabilities inside the user namespace.

> I read through https://lwn.net/Articles/978846/ to understand the topic
> overall. Just mentionining as a possible addition to the cover letter
> (not a priority/necessity).

That LWN article is actually linked in the cover letter as [2].

> Hope these help and can be kept in the loop :-)

Will do, I'll keep you CC'd on future revisions.
