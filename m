Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2392382F01
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777478593; cv=none; b=ZKNw0oEhYbMZobYAK6qOWc2qZraFEuNieTuNmUKmLRm7UJZ+HXt4K9Uj+yUXBlkvTauqxGRE0UeQxQSnKxpQi1ImBCp6WH6zj2kB0Mdeg/4hI1J3HuMxqDW5lOjB7RhgZBH+xqD296dKi3P4NA7ajKY9qRqX82EdEbfQqAk3nQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777478593; c=relaxed/simple;
	bh=ASowbmPasczMP5dbxKPT/+SP8WynqK8x6CIcQuy1lJg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iOopl7SE2LkoJMurXKSCzM98Rz3O3MLRy+k9gNhmW//oyUxWzrSCBGESzDy8hiLDdPwsWeX9NI3K5A487ju+ZOHdHgFWZW+5OaV+uBInEv3s9/CikqZlhY9RVlC12+VbV0XkYrXjIVuFcPUEuEiXhjC26ie1e96/3MfsEZflX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XYe7WzH5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XYe7WzH5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba7fd666666so1236949866b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777478590; x=1778083390; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhdj0vDqY4IK9FGeHJnEdg/Na6gGbjvcG8OkOW45Cug=;
        b=XYe7WzH5WjFuVLEr+IFvaUipKrkcQpydQeex2GHUlN6dsPLQk2e3kOOUJqZrKM/IUa
         lkwPOHdGE12Zqw9AZJ6CLRthWM+0Lxd3dPDH5rjyLY8GUjnARkVMib9mnWQEkarSlQny
         4K5S43LMiBuw5OJb/LgoDWAAJndRlLNje6F0J7VdIfFhOfvxniKQNunZ8dj9+VRPTiqa
         kA4lT7A79KSLyqmjnzWhXbQkCZoDSjT4nYPhLKkNV8V6q/wwrtgHzB51DuvQB9v160CG
         XFqKKHPCm8zmAsqNpND1Mz63M3hSoIFivL8Z1FpdU4zmk/SCdmr8Iv3YaVAZiKDOCerG
         FP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777478590; x=1778083390;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhdj0vDqY4IK9FGeHJnEdg/Na6gGbjvcG8OkOW45Cug=;
        b=GWthiVKMveoCSqgs953dcni8pYR0KTEnSAHYfOK8P3Js4F33RSUhDa0ZDT/dh3tE99
         NPIMgabFM/grnUX83nn4mUBJGtil7Fpbmu2v7PhAbclzh6q06ElF+XrpTzmuvDiJUgOB
         cchvCNAaXKgurvT3Iy3TrQqfARcUSWJB8Ps04u53EUmhDD11rW/g69rZMbGVCj7pLj/N
         9eKOWEVQrqlTe7n++TB5008cSl+k7yundzq3kNdB/LEPwliWl+SfUtBNkAhy00uausGa
         Y1zBCyiT5rILgjNHClJ3P1cJeFB+3XSuy9o+cm1OtsqHYzzYvn5N+/1hVtnrrgobit4K
         fT5A==
X-Forwarded-Encrypted: i=1; AFNElJ8WulGQ/KQiOiaW1AdVs/iugByB8T25liINnXFn3cHl3DEpJbhId7IoYGp1vcWjVQPxo8wKUGHvD5uyb/mYBQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSoAZN8lkvGsGTsfkjqbtSVBK7cDkqkwPj6T5FLI6FrWxzTxt
	6kDBOvpXnCnEKpxg3Z7/2LUhbScp/utXqlWteT6vtB3KViJVLJPmzkk+eYv+90fcT4Q=
X-Gm-Gg: AeBDievZCw8oVef8WKa3kBQ+hOa8Ta9lIf8lg/Vcmphnw6jiXTu8cy3YWofbxZUeME0
	Keovd7rkeqr7krTkceBxmq+fe/Ya0HzW687OiGu5so+BIm6xsp21eDTwELqsKxHRlyy6bxpg/Tu
	xLSnsLhX39NmPCGcJwC0PQcUf4M8l1O9T7XoCEBf+INbrxaqhN4e3Bw6AnlaJxyo/RgSL3io99I
	m74ovgl/kdlz8JDdHpr2rD/Re7muRmHwGGz1XRDxrSF/uNSM5izXWx4WUVPM68OFHE6LUIXtCBE
	Xfl8LK8hcnJBDJygyI/T1SJ367Bjc65NFRpxlbZpH4vhTYuEBebRE/BrDk0vBDZc7b3wlSBVhyy
	45oDWO9vIbIEYyu4iEeeWTQSnHxy9wENtX6KksDsZ93zSg+xXwy0rDrqkcYNo1FzHGlxYLVUrFP
	OXFAZimzegUzo+c3/89OE+tuo=
X-Received: by 2002:a17:907:199a:b0:bae:7a8d:2b89 with SMTP id a640c23a62f3a-bb8028bd7b2mr466986266b.17.1777478589871;
        Wed, 29 Apr 2026 09:03:09 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62982136587sm1265170137.2.2026.04.29.09.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 13:03:05 -0300
Message-Id: <DI5RKLL97L0C.12X4X9HNJNDCY@suse.com>
Subject: Re: [PATCH bpf-next v9 03/11] selftests/bpf: Tolerate BPF and
 skeleton generation failures
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <alan.maguire@oracle.com>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
To: <bot+bpf-ci@kernel.org>, <rbm@suse.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <shuah@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260429-selftests-bpf_misconfig-v9-3-c311f06b4791@suse.com>
 <0625d99bd069ff39efd2a3077ff84b7b0e7be5c2c3129bfbb4f7fc955a6aaae4@mail.kernel.org>
In-Reply-To: <0625d99bd069ff39efd2a3077ff84b7b0e7be5c2c3129bfbb4f7fc955a6aaae4@mail.kernel.org>

On Wed Apr 29, 2026 at 12:13 PM -03, bot+bpf-ci wrote:
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> index cc6ee7a2df93..b104c687dcf0 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>
> [ ... ]
>
>> @@ -607,47 +611,81 @@ $(TRUNNER_BPF_OBJS): $(TRUNNER_OUTPUT)/%.bpf.o:			=
	\
>>  					  $$($$<-$2-CFLAGS),$(TRUNNER_BINARY))
>>
>>  $(TRUNNER_BPF_SKELS): %.skel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
>> -	$$(call msg,GEN-SKEL,$(TRUNNER_BINARY),$$@)
>> -	$(Q)$$(BPFTOOL) gen object $$(<:.o=3D.linked1.o) $$<
>> -	$(Q)$$(BPFTOOL) gen object $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked1.o)
>> -	$(Q)$$(BPFTOOL) gen object $$(<:.o=3D.linked3.o) $$(<:.o=3D.linked2.o)
>> -	$(Q)diff $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked3.o)
>> -	$(Q)$$(BPFTOOL) gen skeleton $$(<:.o=3D.linked3.o) name $$(notdir $$(<=
:.bpf.o=3D)) > $$@
>> -	$(Q)$$(BPFTOOL) gen subskeleton $$(<:.o=3D.linked3.o) name $$(notdir $=
$(<:.bpf.o=3D)) > $$(@:.skel.h=3D.subskel.h)
>> -	$(Q)rm -f $$(<:.o=3D.linked1.o) $$(<:.o=3D.linked2.o) $$(<:.o=3D.linke=
d3.o)
>> +	$(Q)$(if $(PERMISSIVE),if [ ! -f $$< ]; then			\
>> +		$$(RM) $$@ $$(@:.skel.h=3D.subskel.h);			\
>> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
>> +		exit 0;							\
>> +	fi;)								\
>> +	printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $$@)' =
1>&2; \
>> +	$$(BPFTOOL) gen object $$(<:.o=3D.linked1.o) $$< &&		\
>> +	$$(BPFTOOL) gen object $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked1.o) && =
\
>> +	$$(BPFTOOL) gen object $$(<:.o=3D.linked3.o) $$(<:.o=3D.linked2.o) && =
\
>> +	diff $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked3.o) &&		\
>> +	$$(BPFTOOL) gen skeleton $$(<:.o=3D.linked3.o) name $$(notdir $$(<:.bp=
f.o=3D)) > $$@ && \
>> +	$$(BPFTOOL) gen subskeleton $$(<:.o=3D.linked3.o) name $$(notdir $$(<:=
.bpf.o=3D)) > $$(@:.skel.h=3D.subskel.h) $(if $(PERMISSIVE),|| { \
>> +		$$(RM) $$@ $$(@:.skel.h=3D.subskel.h); \
>> +		printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; \
>> +	}) && \
>> +	rm -f $$(<:.o=3D.linked1.o) $$(<:.o=3D.linked2.o) $$(<:.o=3D.linked3.o=
)
>
> Does the permissive mode error handler only apply to the final command?
>
> The TRUNNER_BPF_SKELS rule chains six commands together with &&:
>
>     $(BPFTOOL) gen object $(<:.o=3D.linked1.o) $< &&
>     $(BPFTOOL) gen object $(<:.o=3D.linked2.o) $(<:.o=3D.linked1.o) &&
>     $(BPFTOOL) gen object $(<:.o=3D.linked3.o) $(<:.o=3D.linked2.o) &&
>     diff $(<:.o=3D.linked2.o) $(<:.o=3D.linked3.o) &&
>     $(BPFTOOL) gen skeleton ... > $@ &&
>     $(BPFTOOL) gen subskeleton ... > $(@:.skel.h=3D.subskel.h) || { ... }
>
> If any of the first five commands fail, the && chain breaks and the
> recipe exits immediately with an error status, causing Make to abort the
> build. The error handler (|| { $(RM) ...; printf 'SKIP-SKEL' ...; })
> only catches failures from the final gen subskeleton command.

This is false. POSIX shell && and || have equal precedence and are
left-associative [1].

A failure of any command in the && chain causes the chain's exit status to
be non-zero, which the || handler then catches. Make recipes are invoked as
/bin/sh -c 'recipe' without -e, so the chain doesn't abort early.

Example:
  $ false && echo B && echo C || echo HANDLER
  HANDLER
  $ echo A && false && echo C || echo HANDLER
  A
  HANDLER
  $ echo A && echo B && false || echo HANDLER
  A
  B
  HANDLER

[1]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.h=
tml#tag_18_09_03

Thanks,

>
> This appears to contradict the commit message, which states the intent is
> to "continue with remaining tests" when generation fails. The same patter=
n
> affects TRUNNER_BPF_LSKELS, TRUNNER_BPF_LSKELS_SIGNED, and
> TRUNNER_BPF_SKELS_LINKED.
>
> To fully implement permissive mode, would it make sense to attach the
> error handler to the entire pipeline by wrapping the command sequence in
> a subshell?
>
>     ( cmd1 && cmd2 && ... ) || { error_handler }
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/251156=
89001

