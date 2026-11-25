Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625140;
	b=xrj6Pn8x4A6RWyJ9EeR0E/0kYifn3MzMsyrAzDqhcjIA2L3rEeJ3XURoZnk4chMvNTOQ
	 Bdx/iMSvN2tpfwKjibQ8BJnQn00g6LQqtdxB3LGcpugP4e+7D6MJRH0V6LLhosF8bSSVP
	 fJvzUideOQG/EXAlcBwsCm0YZ8qGH1YKTROMrVtRMynoLHmbF6P36bZdybF2EZ9LPDRq7
	 Y2TJQaRHqa25gHaFKsZmT9SYPtLWLUD6CxvNxUJiDiFsUOmoLs/kAyezn0IHgI4VmYr53
	 vTZq0vIX616gREuh4ho5rHQHdOy4LfVla8oYKwpSYW5gL6kzETs/i1diy/QKyWEhcfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
	b=k0DO39MKHIXzYric1+oLn2C7ytycGPhuX/k+Ow5f5BlyxLKH3bEciS08pMFjvQDFoHud
	 G2G8UoIYdISwDLpWNLprGd/F09sZc3OhOmUg3UEXQ70GGrNaC5mOjhjKwBeGQfk2yKFZe
	 UI+DkwTV1YV6R8nvUCFw8r0v8anaW4MspW0Ys4PQJhK41Bb1k/DSgMqSHdWAVsBPXZTcu
	 Hoq+kzwPbdNbfAVgbdo9ezSbndK2hYQ7+05blO2xmryv8dIsrEcN9HF59+TdTF/bZ+7xb
	 QUQot+F65J85IiHixylLFEvitKejQij/NiiFqmz71m3eTeD8j+5O5s6bukjvnKTJ7jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VeMZMFlK;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270E3606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 16:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 270E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VeMZMFlK
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491971ac844so5413995f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795625138; x=1796229938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
        b=VeMZMFlK4XeBzwrDD6z4Doe5ujZ5PmFlBvgdtXgvDNgqyB2+a2sCMN2wk+r327T/uW
         /r2BhYppBsmLCfA6wEf9rqAgdyevRRA01ag2IXLdtngT05rT8V5qUBbFQDnjjQgYE2gf
         VRO105Wv3wS0sYOzpdh62UmMxKFuJZsiAfPK9beaxT/i9ZUHpkfJOUrelw8QBpX9lGS4
         m35Q/nRZpkrOo84dL5yj6BJK1saMLREXy289b+W8lcU1Li54eo2LPH2XZ2BzxTKFv4V2
         TU/7Cyf6kqOyQ8kgJ2U5PgB/NbN2a8Bu0WSQShF93YOhfgaUMd2kQPQDvfuKKEMIIK8r
         gfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625138; x=1796229938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzSNzkmnLjAnm2o7UEPNC82u2CvWGqHDymHqRLR8nws=;
        b=yVl5hm5h5R4rh7WxydhZCqf1ttr1Sk0IEAQgcacJTkE5b2MOgooJFWNbgoY78l5pIX
         LSr+4iYLb9TwBmQHDk0cAjv4PKU/1jK5s0+NcLzDPXin80q0oyauh7gU5K7dNoBr2vyR
         TmACAMt54sF8U0NI5aoFsznFYdbRur0yEck6yxWwzjByBUDYCGIF20kB2HxseW5Y6jRp
         OQiAuJOi40duWfGJ3oRLxzplrBkt2md4B3wHzOPy2QsmBWqSW51Rlsuew60frhTKQ8s/
         omZflpeK1trgo9A1z373P3et7K563t/eGQW7aDUzKwe8LRfiCEoMSct+aSImo3pzyaI2
         JuwQ==
X-Forwarded-Encrypted: i=1; AL+hErG52PrHeVSaUuo1rQiMtB6dW5OLiAiXMTkDoe/9BmVfbdpeno7Q1EoW5RbEqyHrzKcgqYqhXCcVnYdK0lmkyVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CTucHinv8JfDa0NIVMu7246sOUNVL+wR69rpBGOc7MX+4jQe+
	pH9rEDNy9k/MtvPWN9SCGbgUM3yh02ckib1jU9MIGXGBghJWTngkqR7N04iaPclE+OA=
X-Gm-Gg: AZFdTZf2yfODE8FEU/3dvPKh9UEK+2pBvkJi476Pmw0MmuSev28Fre33z/HEUT/5aR6
	x1/80pqq2gYV2g/SZLDJSiGtJ0EujZgSUGMwuTk+Q4tkTnsYLbe+e8n+Aaq+f980YAz2+SsrAbh
	fhrCM/ExyYJDK9nYtrZVRKw4vofNR/D6yk6ZOGQ+O7imxmx7YE9f0SuxMRfNjrZc9sANoT3sUys
	zGQrgsQjZet7ErflOUVrI9S6k/tDmBuIgW5yKmh4VRWFVpnwgUgfVzZ8RSHlNt3qOQVgEAay4Rq
	RsU6My9uhNmXm27nxW8ee8HDwtBGSBdKJXDh73GuGRVjwJLXQSO0p0vPGJI7uqqy4GQ2onTITNO
	sDO8zEhJDjnePHaTgUn8hNk+E3kxw4InF3IZBhUNsBInihHkiUL5Nd6pVV5jTT12Ac4jOGBmEZz
	hVOsBfMj39WQ4GyKX87PHad53i7O5ESC8Zmp6C1D274duM8ugOBPfd700nt7PMz0wUZU0Wc4jsS
	z76QoqoFdonQpBOejQnSmaiwJRCzYpcX6vYGFA7DlRsoaqhb8zKjmJPDADHkfacbdKExLDGxBVg
	+tr5iNdYp6PUCx9Sqd+ARqwxwGIvSG9ZM9IiS3M1zx10pCeDKAhK55u0PwgkLVDlgA==
X-Received: by 2002:a05:6000:4617:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-4abb18cbe2cmr35982135f8f.27.1795625138335;
        Wed, 25 Nov 2026 08:45:38 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm34852448f8f.37.2026.11.25.08.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:45:37 -0800 (PST)
Message-ID: <0c2e606e-e0b8-4466-b9dd-4db14cc35d1d@suse.com>
Date: Wed, 25 Nov 2026 17:45:36 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 David Laight <david.laight.linux@gmail.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-modules@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-13-wusamuel@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261113221248.3535369-13-wusamuel@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 11:12 PM, Samuel Wu wrote:
> KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
> symbol name or prefix across module symbols in one pass.
> module_get_kallsym() walks the module list from the head and runs an
> export bsearch() for every symbol index.
> 
> Add module_kallsyms_find_name(), and put the shared query struct in
> linux/kallsyms.h, so we have a more efficient linear walk.
> 
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
> [...]
> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index 1ff8ce857d92..72006c9bad42 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -406,6 +406,63 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
>  	return -ERANGE;
>  }
>  
> +/**
> + * module_kallsyms_find_name - Find a module symbol by name or prefix
> + * @symnum: in: index to start at; out: index of the match. The index
> + *          counts the symbols of the searched modules in list order.
> + * @q: name query; if @q->modname is set, only that module is searched
> + * @value: set to the symbol address
> + * @name: set to the symbol name (KSYM_NAME_LEN bytes)
> + * @module_name: set to the module name (MODULE_NAME_LEN bytes)
> + *
> + * Undefined (SHN_UNDEF) symbols are skipped.
> + *
> + * Return: 0 on a match, or -ENOENT.
> + */
> +int module_kallsyms_find_name(unsigned int *symnum,
> +			      const struct kallsyms_name_query *q,
> +			      unsigned long *value, char *name,
> +			      char *module_name)

Nit: kernel/module/kallsyms.c already contains a zoo of lookup functions
with similar names. Adding module_kallsyms_find_name() adds more to the
confusion, being similar to module_kallsyms_lookup_name() and
find_kallsyms_symbol_value().

I suggest calling it module_kallsyms_query_name() to match the
kallsyms_name_query parameter and to express that this is a structured
query, as opposed to a simple by-name lookup. It might be a good idea to
similarly stick to "query" instead of "find" in kernel/kallsyms.c.

Otherwise, this looks ok to me from the modules perspective. Feel free
to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
