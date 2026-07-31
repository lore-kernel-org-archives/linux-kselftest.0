Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF84418F2
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512205; cv=pass; b=oSpISyKmsP170wVrYy+K9pYtw9n2DrhtV4EkVZ/ZHVVwXmSMzSH2LTkbnvR3U0BbG+2Id+tyS4O8OEiGp/6szdcdDpBa69fXJ5DbhscPAUcZtH4L6/p1oVwCKnqTJ4thYEdOH9gD6jj4109AqR2yGfIqbELVnVa3rhlZgQUduM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512205; c=relaxed/simple;
	bh=kPzEtdgmgmrhfEvclMUzFEFQMW3YYfNU1BZsWa7XSjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGowC/O1oXnOdfDV0/zwjtwJ+osNGFNSREpr+hMWK6opS5WsDYwfPoLzRETgQQfExsqTLwIazlUU8MrOiIrEjqlSCl9LHmjy2B3SZ5FJGH2RHctO5Rmar9TOtmv72RJ8sc6oMyeM2Zds4q7/h9LVtAlxVOYNg8wNjEf03XppfjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFc/OdTg; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFc/OdTg"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c4436d02cso5493401cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 08:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785512203; cv=none;
        d=google.com; s=arc-20260327;
        b=YNtREWwa4ziJROsAHrfL16pCxDKDhaArAJD4T0q30jrciC/z5cGCf5SzTmp4sIjz5+
         1qnvdzJMIG7oxl/UKccoFE58tJ92l8WX7/MkFEwKEACw2WaJSBuICGOCqP5UWUmA7+Hp
         smkoxsFonME+1o4kjDxMXbSIIDedeF2UJkXD9yF8OtSsK7juPsLR0uFdMx0HXARyKYxO
         2K5GBPP91Ec0B/Ha8T8R92o+n3SV9+rz/BBKuZ29FxAmpW8CaJ0jD7pfSgQxnE369LRR
         ibKECDWtGwValJcnsJwPcfTaQJ9vIU4pMVLcwnke6QiLVBXNftcQSK7hvHzinTHSxhN/
         jybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X2Of4jWCRo/X6Jl6mIPChW/S8CvY8JmNULo7wwzgn90=;
        fh=QDc0XWDSQCQCarlk3GDax1xmqN7y7niithKBwZZfSxY=;
        b=XBx6VC4y6T5ZLcDNjHhlobFowEvqj9EiWHM4oQckd/IoMAZUHXsHvcM9nXqS+uwae4
         THTWJJBJ/ZLJ8hJzso8NCut/vabKQGWBfUfRRDjh8B/fYZmW4LY3YvJvqZHjwhjjI+Bz
         b3Q3QAsqL085LixtsyPZLiOPaGviAhcLeqMtzWz+2EcBH5ryCFTCbBlcAx0UA6X/Fa3D
         jbXetYDKDSqTra4z0XkP7TlHejJ6ZurQMm5tSfQV8R3rHGGsDUjrs1ETlInoguSA3sND
         B3mYMjKmbCJ7AC7OE2/xc7/doukXHY1QoL83rZrjhluBARktuFCnXmG8P+nTtFOLVEgr
         dsSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512203; x=1786117003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2Of4jWCRo/X6Jl6mIPChW/S8CvY8JmNULo7wwzgn90=;
        b=IFc/OdTggyxdx71WMUkmunfFJv/VBdRsML2egv3SAZWPQsqAefG+GCW5wF/exbuiTa
         QR7uGfe2g2p08Fxi7cbO7yEIIN8XKQYDgkRTTzsgAQkPuO3SGaSSiGhnwIgPexrOySZa
         +pZ+yNZlpxVkvSZoEM6zMPBqP0Vph8OkXnbLafOl4HbYSB/gXqgS0me72Dh31n5iZk+V
         2TfcgprOH90j2Y/h/YyQJmhoWqYtQXHojL9LdYazVTSYgmVIeG3kvXXY655TfaDon/Hm
         OOzMc1jTW2zPFrgbpFNTk0g5clcA9sqMzcETIeySBrsKVqu/NoYYyuQ5t9XCId0uEIcl
         kJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512203; x=1786117003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2Of4jWCRo/X6Jl6mIPChW/S8CvY8JmNULo7wwzgn90=;
        b=r+rOL0U98VAHuZMdRJonsqC1ZPfSt7FxCwhSSJ0nFXtI0JqKdxxlxtlVkNUW39vSd9
         S45zJxVRgUXHoHyaO1AS/O8T7GOPtIdTS7RYAPpqeE3cCsipMXUfc+CtH4IbXYgtRVWV
         oOec3TWtCudNTYb3/mTjCFEBTpR9dMQdW3ZUeXTYWp6hvxY7o/077OMMiGl+OMscyP0N
         B1ZnKOm+FO05ZaBjTuQjD8p2l3BLqcb+ecuQxgRtjOcOCpwsMUSDdsPm9NAmLoq8PFgT
         GEFrBNX26iyl/49q/AiaDuUwI5BT4FVK9fjFBhsC5Tw+hUUOFDCyo/xJdpfEjcm+uNu6
         jFJw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1djNlGGyOu3x2XcdUZ3/kXcULrivx27x3Q9+vSjLscW06p2Tp+KUVcRg5I8ARqMxUPGwYkyYA1Tuv9zXQ8n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCQiqo3zdA3T5uU00cjE6vptcuxsvYqHGbIvHHr7RXEP3a0ez
	xO486jCYBLG5xbu3VrnG2+/TRKS3S+wZPTjs/kzqdBFoRwiDHBbq3J/Wq09t0gpbOVxla6R0FzF
	Gmh4cthllx4fAl6zZGSQLUc9TyFSBSOc=
X-Gm-Gg: AR+sD10SrRG++sUcahQEoymDUWVQZGJePyKCMCH6ne4d1MSgX2lWuF2opPLEQ2DRY9H
	IXgQ8LnoYQO0k09iU/cQQ808mZ5NWYM9iuCL1yTpVji6VpPgP154dfzI5R55ffEJS/Mpn8o3n8q
	A9DOVN0SuY19wsMnLjxKIoXsH8Pt+4tumOU1SvQXqlwGq/7XQvtUby9/yz1x4cKiUg626vzhC4x
	9e+cmpgIxqkI25P6+fBbVjkltVfCJepGCf2Ub8AN3ZdGsONQkxqxpcWUZuyCD36u7JMf1P8BdbS
	nq68EMVZh4LeBMSwipFqFJM3hFMdPq1n01IOy50KPqlNujbQz1LMPbSMB/84W82h09Rm15joT/Q
	=
X-Received: by 2002:a05:622a:1e0e:b0:528:3c2c:5c72 with SMTP id
 d75a77b69052e-52b5679527amr12582491cf.32.1785512202948; Fri, 31 Jul 2026
 08:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-4-dwindsor@gmail.com>
 <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com>
 <CAEXv5_iiNspub=qE1YW-01sV_bxxFUrrcAR4KV4Ec5i_mePtHw@mail.gmail.com>
 <CAHC9VhTS7rSnBqg00ZxNkcZyh_=EeJmn_4z3CTCCxreEEDtTtg@mail.gmail.com>
 <CAEXv5_iHLmzPT3Jj+qZsdt1Nk_5OD4Up3GGV0S9G7KyQshFhDA@mail.gmail.com> <CAHC9VhQXtV_dGt_b5oD_LFNOygfx=37u6P_S32xo3A5aHvnj-g@mail.gmail.com>
In-Reply-To: <CAHC9VhQXtV_dGt_b5oD_LFNOygfx=37u6P_S32xo3A5aHvnj-g@mail.gmail.com>
From: David Windsor <dwindsor@gmail.com>
Date: Fri, 31 Jul 2026 11:36:31 -0400
X-Gm-Features: AUfX_myF-Fa2Dx12J7XG4FMqMoM3YLOYocj4Wcd15kosvCgWFWfK34tns1g5ePo
Message-ID: <CAEXv5_i+OOJqr7xb02=5JMR2O8soLJARckG2CK7yvcv2Ycj+eg@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Paul Moore <paul@paul-moore.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Matt Bobrowski <mattbobrowski@google.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 11:33=E2=80=AFAM Paul Moore <paul@paul-moore.com> w=
rote:
>
> Nope.  That patchset has its own issues, one of which is the location
> of the kfuncs outside of security/; I simply haven't had the time to
> review that in full and reply.
>

Makes sense, thanks, just wanted to avoid churn if possible.

> --
> paul-moore.com
