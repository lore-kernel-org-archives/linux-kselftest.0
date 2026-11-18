Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795021194;
	b=bcBHqnDkjP8ncsfN8/HH0GImNkCeM9chGs0l0XieOb1uMEmtMh8lEsqdMMwq4GllywXo
	 08Ns/+GIzlJE1LycX5t+Falau/GUfSiWER0hd0AS/33IQ+yJX+Rgs9TgF+umU+KyxsjCF
	 Ykx1nfASBaZVYvEPlc7UwbocJYYVy8dn2dzs/ymOftxJCiXUfkh9v6kRRs5rk/acV1Es5
	 IV16EGK9lLx0kJkihinff4yWuPaS6AlLP5KHqYKe/+E///O0dzlQnNbiaZX3VcF2Uxco4
	 9Bk/iaQuAuV+XRGeI5ZPW+v0ydotvBaY5LdpK27I9CQXg1j9DcGEw6p2F2L+Vi3tFmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
	b=DGU7M5UKouDlB6Q4duVfgskEWtRN1pDZF9UbOfqHeRwr4YMd0CvBfc6LRIAP/A0bLZ2y
	 BnAylZib1jyAigQx5qipzREwC25mcS659vL4Swid0wfEGpOqSz4SK19YxKTk87ewuUdf+
	 ZaysoFvo4WLDAd1D1r51xlgNHVegERHH4eXG/O4sLZuydT0yFI1Y2HAGcLX0z8o6cnd+j
	 w/+6vUrWnrxA0MgguWG5B/Jsl6C5vKIqSzxexYWisHOUE/DILCykigCD7q5Bb9njNq6Sg
	 wLISOQ+l0jUoXidMV3IHnaGar7lnlB63WoM0kelSY/Y7F9OO4szxSHTaaC45/UpyAdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="tsb3jtv/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF1D606A332
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF1D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tsb3jtv/
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1a3374400so865209e87.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 08:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795021192; cv=none;
        d=google.com; s=arc-20260327;
        b=ToUjK8BTOtX2WWI4mKX88MRy+1+C+AGwC0aUC6SIWZT0dnC5kx9OIDJbapyg0fP21Q
         g0toIIOtmSXDQQZGvN7WeZT/sD7dPgK5WY+lvyhmxclfCyvgaWwWv+i1fmlBQLdvllja
         jxowWko4UGxZ3pW4i4vpEQuPU5vGwDe4wy7ljbYZyT6iWz1JcGFo4j9NwHGR9DgML7ZF
         IzTkGV1ISVMIX+y2MKgsf2RZQs9z6pQbe8nxcKr0KD8JdV03vmLVOmakhok3rdePo0g2
         oVt1bhF78ChQQQ7HsrbvEwj4YzUySJpoWRfp4C0vRqgBV3kG87QxkhbU9Iz67+fQN4u5
         0x9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
        fh=nun+mDgsSOA/nZZ5RVf6xxxMj5pwRvJXcTEQ0/n3OZk=;
        b=VHkIV6jcu7ViGuOq0Ui6Ej9vmtDLnqw7ZArgrmp9hudpoGNQUA1NphS+Owhr3qnmrW
         jtSgkvhJHrbeHbFFMj05ymrYyTl+Mv+patAnGfBohpWVrsnn6hBwmltBtCAMrRw4+tw0
         BJltNtlWVNM2kS6saQuGSKu2eFg2a93ghnafs7Rbj3OFXM5541AFBmR8MRpbfbDbla+Y
         k02m4zmkPJyzH+royKigsPAC9+MiCusSqhPwwZfs2E8QbTAHUEYt8yORFAGjdn8l6sok
         5TFp+XpkLOwQX8uw6ctxouroBKMyBmOleY080CJ5hnwjxEvnTWKkR4c518FOfe298TWr
         BFdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795021192; x=1795625992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
        b=tsb3jtv/d+zI1r94mKuk01oFSXaGJ5VfBd68Dm3Rzy3k/9SLJEJI9zvC5ERx83P8mh
         L/1k5WahXt+pRRzhHcYHDMSRuJM1TjD5VHtPSmgdvcsE7bgjMsIlMo+YJOsxodt6BDKE
         WgZi0KNeAOjP6r2GiyTfd+fHBUESbduG4DYdClB/Bqst6T6AYc3Y24sbaheI8lu+qMGX
         3hhYwGZJIpgbaepiYwepZXr+V9cZ/bQz35fnXnkTNzQzPv5ISz2zAb8tKPjJ5JQ0vFBn
         iosrC4gHAY/nVJ74V0i+yTKb1wxgWpU8SzcVufvUcALVry0duvdDvm8V8jy8r4h1xcDj
         iTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021192; x=1795625992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
        b=T7nOxk27IBARPDvjIUCjR7mdhH39OebqXLbLQqugrWLC5zHvNUBN99vC1igr1mbPnA
         3COXTpquWIinS1cy45RzGzIdL2wizk7ON2CMv85oB6cPof9fiaXrLEnZt5C7Hr80UTSa
         CzdQeA6lVsnPjL78PeTeas0VkMcY1Mv+nBDkbixGwqDsSKKoAIpy8N3uKK8tlWygVAgT
         qBaSW40p9o1ncZy+2IJKpoEeLjjMEYazfDDSOcuGDRuP3DrI9bR8b5oHPBumEbOYZ15F
         hBCNRjLjVKZcPi8LUsfP82kgGY6sCQAW7CzLlox6IrcTnBp8su1AUJWUU3KM6HhYZRIm
         onBg==
X-Forwarded-Encrypted: i=1; AL+hErGYAQky5B473DQs6XNXUKvKWRAvuyp8I2OdrogaevsXGWprbrhcGFyv70m19oAbRcN55lAT8c7uLd3NTHWTjvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pqPr3nnDfjvbioJmrO3L46ns2lTdOMaqhWKzmPDUtPPWXk4rD
	GrSfbxM6jQ3QP4u6FxD46PtcP15a9V9OA9pIklBK5azG1BFL2yXxnYVr5w0uErQsr6Dw4SSMHVl
	JjCbe4t7jCOlcKIiQS6GulMAnC+ismnV3nitK936i
X-Gm-Gg: AYBFou2M0O80lXELQUCpO+ih8iCgSiVh+wka+3TAWdFJhRxcT55aehpnHo33bxo146X
	WjH16Tu2a6fLFb5BrppVYr+4h8m9Ucj2hQiD3IfgR/L8B2bQNonVNeqKkLGxL7rXPfJmREEULM/
	HLzAWL6rHZV8tt0P03N0dc3K3ygZQGv9gCgS1Eu1yZMm6RRFLyfNid6YHZ7rLLrcud+13lkNrx3
	W6QhkRdK3rlPamXWxnKu2L4JC9GC5eIpKiB03M7Acu0nZ2//OQ9xKKXuiqocmUSOmYrerde8wsZ
	ZYPokArWhTZs5LzNJLjw0mrV0X7TRILpgfWpv0uZjYA+TAsGntGEZTic2FSEHgOzUFbfL7uTCzx
	wa/BPoU6+uUzIxC6xJoSMvrBKx1T6SbZe+g==
X-Received: by 2002:a05:6512:318a:b0:5c1:4e41:3cdf with SMTP id
 2adb3069b0e04-5c1a9c09ccemr1012943e87.12.1795021192313; Wed, 18 Nov 2026
 08:59:52 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117231352.3816603-1-jarkko@kernel.org>
In-Reply-To: <20261117231352.3816603-1-jarkko@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Nov 2026 08:59:39 -0800
X-Gm-Features: Aa3M54p70wvOKpegO09-C-J-9l2I7cJO4B_J5hynU_tjApdK664yCTjVeFp42MQ
Message-ID: <CALCETrVUkbpoFjwSAejyA4b_9qEauAP_36i=O8Op1ifp8aUkqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
To: Jarkko Sakkinen <jarkko@kernel.org>, josef@toxicpanda.com
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	John Johansen <john.johansen@canonical.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Kees Cook <kees@kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:14=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> OVERVIEW
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> A root namespace (rootns) is a kernel object backed by a file descriptor
> that binds together:
>
> 1. A full or partial set of detached namespaces.
> 2. A dedicated PID namespace for spawning processes into, signaling
>    members, and polling or waiting on PID 1 exit.
> 3. An initially empty mount namespace (CLONE_EMPTY_MNTNS) that must be
>    populated before going live, without inheriting host mount-tree
>    ancestors.
>
> Work on this feature started in 2025 from David Howells' container object
> patch set [1], which I turned into a namespace for namespace roots and
> rebuilt around that premise.
>
> While the patch set is manually written, the original motivation came
> from isolating LLM agents. Running untrusted agent workloads made it
> clear that OCI runtimes need to minimize their live configuration
> surface.
>
> Assembling mounts, credentials, and namespaces inside helper processes
> with a half-configured container is what I see as the main challenge,
> and the existential debate around namespaces and container objects is an
> unfocused discussion topic.


I've skimmed some of the series, and I see a bunch of good ideas that
involve using an fd to manage a thing.  But I'm wondering how much of
the value is added by that and how much is added by having a new
*type* of thing: the "rootns".

How much of the value comes from the rootns vs the new APIs to
configure namespaces without entering them first?

For that matter, the cells series also seems to contain a (possibly
very similar) variant of the same thing.

Would it make sense to come up with a patchset that does *just* the
configure-a-namespace-by-fd part?  It seems to me that this should be
an easier thing to agree on, and it's a big part of the complexity of
all of this, and it solves a real problem even without
cells/rootnses/jails/whatever.

--Andy
