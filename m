Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E293F9287
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 18:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786989928; cv=none; b=dXu3fwCxwLU/P+868xE5GndHuA8rV5EfkIyz0kC/VRaybk5iaE1xiyUADart2NxZYyJRQqb09K/NW+d360r5HD8b1ryYm7PhQcGD5SDzCfDoebANtXEGcJMbDn14AuUoq+rsPKGQzqcUWlrpKjCiWpUVwWoEVTTJGsuYbNzsWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786989928; c=relaxed/simple;
	bh=puxzEXMJ5f+iK1f5IpCcEBy0jnFex294QxePdLIuumU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=un4ONj23y02CecNS5K5bP05tnAcQ7b3VBy9IXdWH9uPssQW4WmndMw+SpAxWKhrzQHV9qSm6lIkZMjJVXM3ql3YuEeTrP2HCl83k2CpHSARqyYwRwcS1Px6o/jBc4uOHbOcVWSR8POTrDrn2hB39PIOuBEliudfo2iZkWpLSGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBIkbfdw; arc=none smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBIkbfdw"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c16060ba9ecso34088866b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 11:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786989925; x=1787594725; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KYXKYw3ZJODb57Rt3eF8E0ND+mpiXq6EWIJdfMIbgcI=;
        b=EBIkbfdwJBEFjyCFQO7Lq31lAYvDYdI/b8R+q/5YDBoDF1eWHN1rTZaqWWRdNQ/mbj
         ZLTmt3HFWw38SgIpXpb9utrD2cV2A4HuciIjXQnH/4FhQEnE+8adoSyUshF/d1UdNpGs
         QN4kZDZL5h5RAZpr82knu7dV1lx7Ero3385AkirS/yi0IvKPF9tXExcIkachu3bIDyRo
         gx5pVA1aSczB0NmjQl/qzffoUibv2imLiB+nd2YQlXyQfOtDnnoUYC2cjAw9IvbML6pj
         PBdbPlR51GqWWfGhISa8KnLPt9lMFYAQNgexX3RF/UKatjWw00Dc10VDZSAXbTnx26e5
         3rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786989925; x=1787594725;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYXKYw3ZJODb57Rt3eF8E0ND+mpiXq6EWIJdfMIbgcI=;
        b=qSxLPj3ijhlPgpOqDU4j34wrNtvrDLRdzZYpTSLyKDtPYlFzE4DO8wGi3spiFWS8d9
         ZOjQT+WcuzXv372CrLok9xKWeUZTppcN6MUpxWTYPj9PJ3Kcf9kZm0HRMZjcNns1Bge9
         LrnG/iLXc9KAtCN5stjwDRT48/wJ8/zDBFTkcay9fzo6vN0B83CLd3rBSIW/pw3TuXxH
         oaQGLTMHB6h5XA9+ZW8CstMvube1hgsZRGn46ifOcMq8kxkzMAzbGHkf1nohsh5X5Q2/
         MBD5hdIx4ZCvNiGccUs1JP2zYodCXFTPX3/dA1FWNrcOVjn0Z6kM0Q40fGbwFyyOYzHZ
         +DUg==
X-Forwarded-Encrypted: i=1; AHgh+RoNWl1VS+UtJo39nCBWhivARpWDME58/Y8ca5K9R12gUxqclOfrnVowXZN1YJ9cIDe3bp0wfQ9lOTxPAg21Fbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywttqi7ecOj+oQ+zf/Nu0zYYVb2+2y5K7zaMj+IlrCL04MIG7yl
	XM01tZZtZKVSRO+Sb40fI09atN9gHcl5HCmsij+4tgIJYfPH1hg2eS8d
X-Gm-Gg: AR+sD10J4UD/lhJ7rPiztm3Q/qmqJtDIrMqgAurSv12v139lMMI32ttNYFDWLHW40Jt
	/vM2HServsVdtFqsoV0TYAz6V0wQUIJGuekleNT7STD+ntj0gqZpNRUK4yHsLZ69zNonrTOFuZN
	UgaYbpz4HBiC9HEPJRjcR+gyP/GzQUVbGN4xGGztpQXdulbPB5TBQpd91nonN34+s1RSooThho6
	RyVbnSWrHMu5dkM4FgCwrIcrlI2hkloJDhmR1bGsebPuwdhWJNlIoMIjvcvcSLxDg4aSIqGchIK
	b+FO/ENuwBwMrtY+7yp0ZqfrL/brL0hFuqfIDODDF2DSrwFFyXR3rKxP4oIzLNAMJB2/oETXhx4
	ojTN7IhtSy9JkBjO51+8qQN0YzPRmtGxV6Qq8taR+l3dKN7+c+dw8cPEomzyL7xqz5z2bRk/UAO
	Z6eOV0fuvxLY8zrQwSv5tuGmzd0256Rx40kqCEMR2F2a9LfbIYzvmejDbTRdcMx8p5aV84VUy5E
	K/92W0tsDnXqud1omr2wbgw1ppnW9ktiHwKnWIur8dOCFDQ5OpT5VIwMOtbz0FQiHVSwop5+k9J
	11Sv9sSdnT1/UbLOxUINKus+3A8=
X-Received: by 2002:a17:907:3cd4:b0:c20:a243:9a52 with SMTP id a640c23a62f3a-c218ab5bfe4mr63468966b.0.1786989924403;
        Mon, 17 Aug 2026 11:05:24 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187c83829sm34392966b.41.2026.08.17.11.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 11:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 20:05:23 +0200
Message-Id: <DKRF25OV39DP.2WZYYSKICG68H@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Emil Tsalapatis" <etsal@meta.com>, "Changwoo Min" <changwoo@igalia.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Shuah Khan" <shuah@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH] selftests/bpf: Remove duplicate copies of the arena
 spinlock qnodes
X-Mailer: aerc 0.21.0
References: <20260803001807.646357-1-changwoo@igalia.com>
 <c9f8616b-15df-4c5a-8184-bf4d63813afb@iogearbox.net>
 <75bbbff2-5ea5-493d-b543-ce40d968f3cb@igalia.com>
 <CAMe2y=Gm9K3cwsM7Sff3ZaKani3z4tVUQv9u1KzbetJF8OrW=g@mail.gmail.com>
In-Reply-To: <CAMe2y=Gm9K3cwsM7Sff3ZaKani3z4tVUQv9u1KzbetJF8OrW=g@mail.gmail.com>

On Mon Aug 17, 2026 at 7:14 PM CEST, Emil Tsalapatis wrote:
> On Mon, Aug 17, 2026 at 9:02=E2=80=AFAM Changwoo Min <changwoo@igalia.com=
> wrote:
>>
>> >
>> Hi Daniel,
>>
>> On 8/17/26 6:05 PM, Daniel Borkmann wrote:
>> > On 8/3/26 2:18 AM, Changwoo Min wrote:
>> >> bpf_arena_spin_lock.h defines its 64KB qnodes array in the header, so
>> >> every translation unit including it emits a copy. __weak makes them a=
ll
>> >> resolve to one instance, but bpftool gen object merges only the symbo=
ls
>> >> and concatenates each input's .addr_space.1 bytes, leaving the surplu=
s
>> >> copies unreferenced in the linked object.
>> >>
>> >> libarena links ten such units, so nine copies were dead weight (bytes=
):
>> >>
>> >>    object                             before       after
>> >>    -----------------------------------------------------
>> >>    .addr_space.1 in libarena.bpf.o    676200       86376
>> >>    libarena.skel.h                   2100123      892371
>> >>    libarena_asan.skel.h              2641124     1466477
>> >>
>> >> Declare qnodes in the header and let each program define it once:
>> >> libarena in src/common.bpf.c, and the arena_spin_lock test beside the
>> >> lock it guards.
>> >>
>> >> Tested with test_progs -t arena_spin_lock and -t libarena.
>> >>
>> >> Signed-off-by: Changwoo Min <changwoo@igalia.com>
>
> Hi Changwoo,
>
> Sorry for the late reply, for the next version feel free to add:
>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
>

Added the tag to v2 and applied, thanks.

>> > This doesn't apply cleanly, could you respin against latest bpf-next?
>>
>> Sure. I will send the v2 rebased on the HEAD of the the bpf-next tree so=
on.
>>
>> Regards.
>> Changwoo Min
>>
>> >
>> > Thanks,
>> > Daniel
>> >
>>
>>

