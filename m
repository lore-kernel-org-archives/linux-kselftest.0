Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653751;
	b=aUHTlGpGzOn8wB+pDaQ+W2djVgUWpfNJfJxLIGYDejOvMSKeCbuOtrTNAYl0F/9gQ3Vr
	 9zxen9D2xyUF4zf4/IMoFE2E+AxnO6m/fqLKicp75ezJGow1csc9brK3vTaFhvV2EeaNr
	 CAQs95IyqPTZomDr7mv3gG7IgyychUf5es4ozAT9FTrfk/kv8dSJgHx4ti8Qk0FCUNDzV
	 12P7qexh8hdOrmDVlnFIlAOiVykAcVKWnS2ps9cKkXTwSxmHWN01Wzfo2NzkWMPcMK0XC
	 I+IvxNNhTiwRQJfpTp82uxNOd1Y1ukA41KKTm92zwQ148cA8WYWro5wVoPJBWr3Ej0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
	b=OYRaTlm4mdymq9IAEzA2Sj5ehjCK6yNUZfEgUw3G0Fat5tzpmKf1stY/3Bk3vv5WB0/I
	 tu4noiLuaG70xuIgXYgaXRqGVgmt2dUJ5vFe5Miaf9tVSw05+YrPi8Ri30yAx+LkmZW4g
	 wWuYQMP3apGp2m/Ue1WQKJdbtk+jTiItURfZP2MZjDjfgwWWiTH2dX0EjThNSaNyJa9CA
	 Otw9x6fLefRbxGEq8tzrA4lo+0q6XSPbm5kwmHCqLdxtg9ZHzYWfsVp8wvczS8Xkv8b9Z
	 xQfY6SjdO8vwD2w0ds09cUnGSVxbAxnsMF03l48uLRk45Q6LDJPTb9P4nLJBtMw22Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpN49+az;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC77606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 00:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC77606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LpN49+az
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4322d310e7so109260966b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 16:42:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653749; cv=none;
        d=google.com; s=arc-20260327;
        b=kvSwqemMw5G3Hv48aGdw0+5ngzrU5njmscZ6A+VfGKtzXmmbxKX2f5ZKHHsy4fYv2T
         6VbClu4xKDaZWx02mRj6FS3tx0JBLVIIKWOZKTNycLWfBzYzZd2eFFH7UqPf59Nnfs5l
         cYfmptjSM39xm5yF4LluiHVwAGrnn17ZnbmQl+sovTAFeNlhlMo55scdzQoHkd4MaiWI
         mSjND5mLBqZEBi1dK4GHZj3C7565Xqfh1UVD1DvujBD13UqpY9jJwpsx8jtVeUut+c0j
         38vjjO2FFTnHYo3jhjuf6inAF+G+U9b7w7XTcjQhG79nPpM5qyZ2I710MLsXQ0tf3xF3
         ltcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        fh=shslwOVmMDPDVu0gPGOwV8YKnbGXffPNQwejxSKzBYY=;
        b=p4KgSt49EXi7GWNA8ZxHQDkSKTJXMjCMasNCNYh7bLR1MrOUow0KVA6B3ouTfxgj0M
         ziT0/jYlsUwR0gszp8GZTkJJ7ZQux2ijNMJ1D3SDT2zVUhyiAePz7YX92v1XOpp2VzLd
         MtTwiYaIgRWigZnv7GQImVq6tr/auRCBKYAdMTS0MkeAjY7+GWxgr/d5Qo0tzS/926hS
         iMs65Mzx77vUFCTmzUOiT0Go4akNHmk/4H0F6Px19uq9FLy0Dwlp2c78I7bmcL+aBEmt
         xHFqLGtISEJydkyYSq70ST3BRnV3LGA+l2eXxiaa1FvzO9skVJFqYHHQN1oI3YnMUWx7
         4sqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653749; x=1796258549; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        b=LpN49+azCIrNLot1wWdZkbi4Wt9+5r7MX19ZP740YGH95NjHPkEZ3J8iTn5nZs2aU0
         YtfDizzXcozDLpMOLK52IGL19BDPPkZBwwaARaxU027w//2VU6VirePpo9PC6B6/Gvyf
         w2GVoXFxRvXbXsOKb1KJ+C3LWAAUbXNTn5yq/DRtNMB33KVLBN+E7CMg2n3o0WEACasU
         2Rm6jn9HoFPOXbo7vWifWbukhD/T5j5US9xUFhxajKYt4rvNrF1rO1KNwomR3ZLuXZ6w
         QUOmuxgTXoYSvlHBVpUm9Y0LfNn1TpJbekKTAn/WwvKBAhjn4jwfG9HFJEBd61cyDiFr
         AG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653749; x=1796258549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZhRPRVq+8pg+E1wbTr8QWwirSLbboBqk1ZBZKkJ4bPE=;
        b=l8jatvq5UXnhoUhiZd0oO2apyI214gSdmuzSH1o62UNIs4OUCqkYffn7O88PMhJ08c
         4xTLWVwYroqaRjzG4cowsLShLHzHINB5pLvMgToASJfC+HMUYLGg4O4mXfTqYpJNZyJc
         B88LLQVnnVhU6OtoTFNfbvwY2y7c006mhk29+5bhH4ng1zVG/maLDxzzZiVHoJQLkhJt
         ZLQ0LiJUdFnNmbg4tUvNWz+PoUurhFECDiX5tChi7BnUVFUWvPxDBGd5CoYVbR7uUiOQ
         le6Ix7fmvQP7wnAh7DT1DCZQa4q6fkGS5WerT8+8OZ3bAi1oQwNNTxPA10Kmr+u0OVmO
         v8FQ==
X-Forwarded-Encrypted: i=1; AL+hErFf8DSSjLoF2Xb8ZTDG+6YoeuwYagT8wDZJtPg10QEk47triJ8dTJijldl1jzTKDRNO4h9n3HLUOBB4dP/Nsc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SEOF+0xCAru6yjo3JYpVkwHyIGBigYCYtPi5EcaGfE6nlQuiw
	Vo4/rpyo324BItOprvC1MaIxXCoHuxTXnGcRVKBESWJ30HJEbkHIo/YFNkew8d2NClZuYDbCllr
	BMyEYRjGV8PSxUfvOULtImeNDdKmBmPXTM5TM7MJX
X-Gm-Gg: AZFdTZf1f6FDZVZNWpsKvldbWpXqxufXz9pC5d96jN/LPuV4dSQ01hHH4ohTUN8iZke
	2gQkSv3kEAuVxWdb9n6wEeJib2cVhTT4A8EHOWyRj/bca5hHPft65cKWqP/GxKzcuhfj+B8fMgt
	unkaU3Jrsz0Su3g4Mo0DI4Pp6UJCW7PUmHatxG5c4IVO5Zv6HjMsBCyd//si+evohDsQiENLjgf
	Sg7f/rkcsUi2b9kAg3QJnZS+X/NS/Debz7KZX99wCwVbu812uYomAB6Dhm+f+v2Iws7w62T5kLO
	uWpne5OwyP7DxXe0kZ0eInZBbFqtJyV71/AmRwcKM/kCIQHkXsfoc7PvWBVnRb9Xd2ZNBHoCxuq
	dPTl7K30gT+NLqIx1VSSHKV2YPJRcoE4REVXfntwyPlccxm1M2wdCm4bRzfvXfoRTkkJ9MUWhTl
	ss5M8+BdjuwWgj
X-Received: by 2002:a17:907:da1:b0:c50:5275:fb97 with SMTP id
 a640c23a62f3a-c513acb5e2emr1626085466b.47.1795653748662; Wed, 25 Nov 2026
 16:42:28 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-13-wusamuel@google.com> <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
In-Reply-To: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:42:17 -0800
X-Gm-Features: Aa3M54rYVczs2SqMo55_UQYl-QiaJqAFTx0CS_STMdfssfUbqw_TSopd5IfB7RE
Message-ID: <CAG2KctrMMo0j9Mnbg8fdNsSc-eQaaaW51dO4mqwVNn3hfSdx_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]
> > + */
> > +int module_kallsyms_find_name(unsigned int *symnum,
> > +                           const struct kallsyms_name_query *q,
> > +                           unsigned long *value, char *name,
> > +                           char *module_name)
>
> Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
> with similar names. Adding module_kallsyms_find_name() adds more to the
> confusion, being similar to module_kallsyms_lookup_name() and
> find_kallsyms_symbol_value().
>
> I suggest calling it module_kallsyms_query_name() to match the
> kallsyms_name_query parameter and to express that this is a structured
> query, as opposed to a simple by-name lookup. It might be a good idea to
> similarly stick to "query" instead of "find" in kernel/kallsyms.c.
>
> Otherwise, this looks ok to me from the modules perspective. Feel free
> to add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
>
> --
> Thanks,
> Petr

Sounds good, will apply s/find/query/ in v4. Thanks for the review Petr!
