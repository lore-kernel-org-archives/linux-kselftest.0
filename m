Received: from mail-ed2-f0.google.com (mail-ed2-f0.google.com [74.125.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CAF233929
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787524430; cv=none; b=FI7HsP3r55X/bSr5U3mbEHv1i34xyFylpPh/HWANi9Yymu3S1jB/Qbl2Q/kqe1A9o9CaEhcTsG/vTxHJKAW0XJhNWDyovOazN6VBv6d8NQDB4ijNaInMs5LuhRC9dC+ujY8A9cpsGqUm9lhfBRUxQJi6zt2JsxC0SP5ey5t82Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787524430; c=relaxed/simple;
	bh=MF014Wn/1ktJMcxYPUeAv5S7kpw33NiOXZNubDqHMVE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=GUzhT9phvkBMkmWfi9SKHRHroZ0mmYmgjtf8w1SpMzUBDuaEZ2IIzwwan5e8iLNzMs+NcdfEXYZarNbLZEvFrgck5BoPCvBwXV2nhJQhjHe5XHOi6G44vbqtW32cTZG7CkV4n3nXopEKgN0oHqjZjcimy9RWXLBo3SWnvvuWj4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJVDN0bv; arc=none smtp.client-ip=74.125.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJVDN0bv"
Received: by mail-ed2-f0.google.com with SMTP id 4fb4d7f45d1cf-698447ea5aeso1497221a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 15:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787524426; x=1788129226; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lYkyJQ0qHX3nXddsJ2v+UVkUlJlJF6rc7cRHknYRPik=;
        b=KJVDN0bvvDAQLtJtPNyNclLbxA4OGHllvFcZX/oqCpbHBvYRD6Xwaf0JupTe1aYbMj
         izJuSJKNbCLb3x4V7wC/p5VKF6/sAJ9xGPlOXmldxrAPHTNVjGLXoMBz5XJ6dn7JwJdf
         jYQTID+RJDOxqnk9BMFk7J5K5U37N+3s2sNMegMtGJYlGaj9bO897PJXQuRo+fI5IHP7
         5ApZstztGgcnnIeDvFNxOlWbCnxuriAm62KENxOOnduoKqi6wtCoKhkaORSBHTnILEhx
         F1BnK3FDZ+mkOFU1CFPsrlelGW5W4hO+2vI8T+B4r9rXwHMbSKfeSXp8x/nWh4JA0hIa
         4YiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787524426; x=1788129226;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYkyJQ0qHX3nXddsJ2v+UVkUlJlJF6rc7cRHknYRPik=;
        b=LP+W9SWFPwaIzw1bCZ3s5nRbu+pG/7JoHI54d6mIa7ps17zr9IcDrIq9iY8xj7AjKw
         Sev56rcWn8kQn8XJ7VpVLDixCO2gH4DfW9lkW15RqJRNrf3NfKODRWd1K4DrpBpAlWjl
         xTK5FdsjoI5IOCEKWOlv8EDfBO4VVJshPUQ5ShWG5VXgVvrJUT0pKOCzkH5AW49qZ7JA
         nvQMNa61vVmlEEGnC6eltm0K3zqK6fwtD2/eQnncfws88GjghER3ao6wKZP/lQZ846HG
         1/zFbBWYWVeHugaO/G2PI51c6I7aqvs7Y1LMScxlUhdjJWe7DCHy9c552ww6pgu0pDkz
         0Fcg==
X-Forwarded-Encrypted: i=1; AHgh+RpLLYEIn1TeNuDtChSRGDYgJX8+gQ+vlCQF1a8EonTb3srDpCOGA4+SNBAu1yDnqLh93c9H3bMMNAdAcY6M+sU=@vger.kernel.org
X-Gm-Message-State: AFuF++n9Uf061fR877ZnVMoFPt+Oi7S5YDlDEYfKGzb51wu8ATgQsMw1
	hYU48mo5jHEVVyA59oBa+BL2+AXYiGn33Xi5WyN2RDQxAuDPmk6lheKn
X-Gm-Gg: AR+sD10lwn2OBkMMxVOmlpIcu2VYi06aN0uTXXv7By+cLXgEnOscqfqsS5RtaRpAMqz
	JoDPuTbUGVYUxqttg+Vt03h+dYnE1juHXSENEUgfKD70nG/dOz/0qri+7KnsCjer7vZP7bL37nm
	LWMniXLKINWwWGy1eZ+1hLVQsMjhhxyBjqnNE1ySOYMtLMKh2oboTQ5p3+tU18rFG5SUSRZvmWX
	Dqk/xg2NbiS5rGRKiBP+vBpSYyflCa82u5xQuS5MHtqHIk8DWPzTx0kJRgkhXFAHzii8LOLaMxt
	mOPj+fd9XNiMFxXZjtRvm7EOF5oIbaQEAFNxx0Foyf8YqIXiTc7x9LBWhQevDpQ3W93nX5SrFA8
	oYkNZ4bCMbIp+RDFx4x0hg4PnE4f5m4kMUfP3Ho5xyxEJUuNJ0OXlaom2gHdfxUo6P4ydn8wrYj
	XoY7EQe6krWgA+Wg8Vq5mHYPcImZScrCU+1spVQO4PMTVxAj4JqGJwhwjlAUs6JRyS7oepOZpf6
	feoS7xruD+JOXQ8qgG/FJAgjqdl5Kw9jYM1df9JHsRp6mwLu3w6oMvKp3GzT8FTGWJN3NkFtitW
	bKU5GexlxO0ZLVHbj+uiPtfNan0=
X-Received: by 2002:a05:6402:190b:b0:6a3:fdb6:9db2 with SMTP id 4fb4d7f45d1cf-6a42f14dee5mr24209554a12.3.1787524426138;
        Sun, 23 Aug 2026 15:33:46 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e025158sm5810420a12.11.2026.08.23.15.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 15:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 00:33:44 +0200
Message-Id: <DKWOIW8NUFZA.1QPBXZJY5YYOL@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <bot+bpf-ci@kernel.org>, <alexis.lothore@bootlin.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <john.fastabend@gmail.com>, <andrii@kernel.org>,
 <martin.lau@linux.dev>, <eddyz87@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <tglx@kernel.org>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
 <hpa@zytor.com>, <shuah@kernel.org>, <mingo@redhat.com>,
 <andreyknvl@gmail.com>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <laoar.shao@gmail.com>
Cc: <ebpf@linuxfoundation.org>, <bastien.curutchet@bootlin.com>,
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <martin.lau@kernel.org>, <clm@meta.com>
Subject: Re: [PATCH bpf-next v7 1/9] bpf: mark instructions accessing
 program stack
X-Mailer: aerc 0.21.0
References: <20260822-kasan-v7-1-99afee6ef7fd@bootlin.com>
 <f6a88fe55d543f5fe2a6d9e856acb4cf1b87b8210de58459df1272c8a456d926@mail.kernel.org>
In-Reply-To: <f6a88fe55d543f5fe2a6d9e856acb4cf1b87b8210de58459df1272c8a456d926@mail.kernel.org>

On Sat Aug 22, 2026 at 1:24 AM CEST, bot+bpf-ci wrote:
>> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
>> index 004b06785521..412a13a664fa 100644
>> --- a/include/linux/bpf_verifier.h
>> +++ b/include/linux/bpf_verifier.h
>> @@ -725,6 +725,8 @@ struct bpf_insn_aux_data {
>>  	u16 const_reg_map_mask;
>>  	u16 const_reg_subprog_mask;
>>  	u32 const_reg_vals[10];
>> +	/* instruction can access non-stack memory */
>> +	bool non_stack_access;
>>  };
>
> [ ... ]
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index e036ae20bf6b..040af75d9550 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -3272,6 +3272,11 @@ static void mark_indirect_target(struct bpf_verif=
ier_env *env, int idx)
>>  	env->insn_aux_data[idx].indirect_target =3D true;
>>  }
>>
>> +static void mark_non_stack_access(struct bpf_verifier_env *env, int idx=
)
>> +{
>> +	env->insn_aux_data[idx].non_stack_access =3D true;
>> +}
>> +
>
> [ ... ]
>
>> @@ -6654,6 +6659,10 @@ static int check_mem_access(struct bpf_verifier_e=
nv *env, int insn_idx, struct b
>>  				clear_scalar_id(&regs[value_regno]);
>>  		}
>>  	}
>> +
>> +	if (!err && reg->type !=3D PTR_TO_STACK)
>> +		mark_non_stack_access(env, insn_idx);
>> +
>>  	return err;
>>  }
>
> Does this test read the correct register type? For a load instruction whe=
re
> dst_reg =3D=3D src_reg (e.g., rX =3D *(u64 *)(rX + off)), check_mem_acces=
s()
> receives reg =3D &regs[src_reg] and value_regno =3D dst_reg, so reg point=
s to
> the same slot that gets overwritten by the load.
>
> When the pointer is PTR_TO_STACK, check_stack_read() runs:
>
> check_stack_read_fixed_off() {
>     state->regs[dst_regno] =3D *reg;  /* or mark_reg_stack_read() */
> }
>
> By the time execution reaches the new test, reg->type is the loaded value=
's
> type (typically SCALAR_VALUE), not PTR_TO_STACK. The condition evaluates =
to
> true and marks a stack-only access as non-stack.
>
> Both check_load_mem() and check_store_reg() snapshot the pointer type bef=
ore
> calling check_mem_access():
>
>     /* verifier.c check_load_mem */
>     src_reg_type =3D regs[insn->src_reg].type;
>     err =3D check_mem_access(env, env->insn_idx, ...);
>
>     /* verifier.c check_store_reg */
>     dst_reg_type =3D regs[insn->dst_reg].type;
>     err =3D check_mem_access(env, env->insn_idx, ...);
>
> Could check_mem_access() snapshot reg->type at entry and test that snapsh=
ot
> instead?

This one also looks like a real bug, we should probably save the type befor=
e the
call as suggested and done elsewhere.

>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/325348=
28209

