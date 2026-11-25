Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604633;
	b=WGJDUhaBjGdq6b3l62lYBiS79u3L/DwnKtdd9e2M1Km1pp5Ge3+gnG+IECkAJJA4kQ4L
	 VYoaYefX7xzUkQo0BGxw4lfD1rbjY5Ae9cfS0F7Bz4N3rECX7Mrp6eSH76Lb8ZVTxPqSJ
	 cQm4SpEo1kA7TImJFdTgmFopD+IBNelIilMClplUFFe03LYOFBJvexx0x607DQM64WogA
	 2VGqFd8zS2EmMQ4TK9n4fsWYQYrFe7zB1Pt2NaWZamgsXetPr5DaQqZngpXln4Egb5+XU
	 6xQ+DMMc1zN0WH0JF7FdnX+W+AGzqInw0oKLjuxcXxJzL4tJc4Qjsag83j1QQIHRupQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604633;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 DKIM-Signature:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Subject:Cc:To:From:X-Mailer:References:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=mrSzuPMkqX4MWQZ1Vs04gvpO/41JB6WErbOM51m8MaU=;
	b=sPjycSFklQcRYUvJbKOuMKBR+xAldokk5yvdCIWaYOVMBLoqF86TgEQZRVJzAEPrizGi
	 8DBukVqZl3QcBfJ3NO9wIgE6ZkqUbB8DFzmeSephlRvvFJEXp2uNDVKoFAft0R7YlFgz9
	 yzuyb7QKtG4W/juynoGNqOGyChUsL5t3QjZwPcso/tuyXYuT5arB0upGcydtpGgy9kmF1
	 Pf3lgcMuCllOW/2fkbFWnKk7KWp6qxayNMH1yyPIXnenCK9LahIPD9z9poVaxw46nQxuy
	 sRIUu1gflDGeWm/2RqeMeoI3HS21rHiQI0ESx3V6zEMRrT6LZGYZe7yVuXlasab7Ksg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=mVZBe53b;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E786606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E786606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=mVZBe53b
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-53ec92375d2so3402273b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 03:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604632; x=1796209432;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mrSzuPMkqX4MWQZ1Vs04gvpO/41JB6WErbOM51m8MaU=;
        b=F88xIhcyXKPMx5Tz1iXP2lqfxbRADqbqpQIaixPXOjY1Inj4sgHob2TU5KR4Iyohfb
         lzN7t1Xxyo9ALRJUS227lgHrDZ7s5IWhZnD5Ha70is7N8z9axuQONouxcB6Djh/uDgd/
         +tApmGj7nqsd87kN0UASzvEa2Hhu3MhjEx7tXGsvxNTwI4ZzvDN1eg24Af7l21fXXBwQ
         9e0G1O0zJm4oYSSSEWFWNeSPGSIpG4JB3pjvwyW9UP73T7z773TwIKP8COZ7vSLKwUcb
         pGrGPEwTnj/CnnOGQPo3oLG8d71Tg7u51lFRg75xBdJc4DV8ffx1ubSo0hsoadE6OoXc
         ZnRg==
X-Forwarded-Encrypted: i=1; AL+hErF7mKsKu3DIzGfIO8l8p3S75CC2VembTfn6o2t9geDlQfLVCnUuYwYxa6UG6Y+eTOvTLwa/sPHuEdmXmQNznhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EhROuNPs6ylAGuKd4hQS1Y677fOaMz2zP3XDopbolzPHVYX/V
	UGTDvSzBLm5rTfBa9HD4FfK1SH4/0lEWn3BrVt2eEiuruYihyabtvKKn
X-Gm-Gg: AZFdTZc6E8ax29S53b/SM3hriiSZzKdeC0+6C65CBdAAxA5x5khCHZYBdh6aSdlqoKy
	kIyRABS8w5DDadSFty+iuiyNJOyoVllSrqypJ+vqb4cRNXS520JVVHXquG31uca+aY9Ya3jIhhg
	HcLY4eKElqD57X7BYCpZwLHiXjpSGxEJKjAYgL97018ITsnnPhq/Z4uW4f2/nORg8XbWB/2qy/E
	AaBRj8FoofQLzQ6KT7sHEzvMcrL6/uM6vxVBERKOvgeebHPMx4MxX7VsD0emtgwx6LdtegpvXFo
	+G+I6OfPmOg3ff0qvbOLrXbIasjT/fLl4ozDi+xSZ6r7oXaRrdvpzA8heMWc+5X7z3z3JmBEh7D
	4wyat6Xtx2/ZM9jJ5Sjhw75Olf3/QlRbB3WM9Bpy64HyTCcduvHhuuBHdiNzjC1kziFXVlQNN2j
	AQ4kAlgclwjA7edhnlQHxwPlxtfUeoIcoWSnPtI2SoHB2Qb0D5OS+l6h9XYaaMloaOEJCvAl5Bc
	re4g2NYdCFS8rsViaL5x5mYKTIBDA2qa1yxJ6OhcpfJCq+FiuQBMMbK+EPBdtRuUQfZwlG/nqFN
	qKmmuYi9vzX9cDvoQyEd2oByST67Ij8I6CmqD9C8mX8ghP4gIL0HvOKXqa6BuvMqML11UxJ+1+k
	fEUtSDjnCuzbPu8G16miXSHs9nrI0Xmk=
X-Received: by 2002:a05:6808:3195:b0:564:5fe0:dd80 with SMTP id 5614622812f47-57a0c6b6b35mr18642000b6e.49.1795604631958;
        Wed, 25 Nov 2026 03:03:51 -0800 (PST)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35655a5bsm13720074b6e.13.2026.11.25.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:03:51 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D3B7605F4;
	Wed, 25 Nov 2026 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1795604629;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mrSzuPMkqX4MWQZ1Vs04gvpO/41JB6WErbOM51m8MaU=;
	b=mVZBe53b+1iYEz2JUxIuiNR9+Py0/uSe5+otcdgdQWU7Taf9dvO+hB3dYAycHS4mpFX58G
	vV6DZzVxJ5w8FUgTr4XqUexlvB7GaFWiW3OZc5E5vLnquW3/R7BVCiaQEAmhTwaI6KYcz+
	WKMfwezQ7cQLflxSwa/Npl0fQJVmkwKtEmDNd5aNJMCbzuVVe0ajurUaD5bCcm6NTco6Ds
	1vtjOlq9kbB/huibnDLki/qUWQ4E/tssU1ut6areHNAORl2PP6lefnfCyTkQSBxPYZQ5Pt
	HHr38vyct1t04ZK9gvI9jxbGiJLcYvYDkBcVLc91Rz0kWIqh8m/9Uy61UkQceQ==
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 08:03:46 -0300
Message-Id: <DN48PTO1CTAC.3DAKV5TKHPXLJ@marliere.net>
Subject: Re: [PATCH] selftests/bpf: Fix kallsyms parsing with long Rust
 symbols
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
X-Mailer: aerc 0.22.0-17-g7220139118bb
References: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
 <DN3YHFL4G7NM.36YOROLVGCSN3@gmail.com>
In-Reply-To: <DN3YHFL4G7NM.36YOROLVGCSN3@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 25, 2026 at 12:02 AM -03, Alexei Starovoitov wrote:
> On Tue, Nov 24, 2026 at 03:33 PM Ricardo B. Marli=C3=A8re (SUSE) <ricardo=
@marliere.net> wrote:
>> -	char func[256], buf[256];
>> +	char func[512], buf[1024];
>
> can we drop buf ?

Sure, that works, thanks for the suggestion! Sent v2.

>
> diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/=
selftests/bpf/trace_helpers.c
> index e871a26..06f6553 100644
> --- a/tools/testing/selftests/bpf/trace_helpers.c
> +++ b/tools/testing/selftests/bpf/trace_helpers.c
> @@ -64,7 +64,7 @@ void free_kallsyms_local(struct ksyms *ksyms)
>  static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
>  {
>  	FILE *f;
> -	char func[256], buf[256];
> +	char func[512];
>  	char symbol;
>  	void *addr;
>  	int ret;
> @@ -80,9 +80,7 @@ static struct ksyms *load_kallsyms_local_common(ksym_cm=
p_t cmp_cb)
>  		return NULL;
>  	}
> =20
> -	while (fgets(buf, sizeof(buf), f)) {
> -		if (sscanf(buf, "%p %c %s", &addr, &symbol, func) !=3D 3)
> -			break;
> +	while (fscanf(f, "%p %c %511s%*[^\n]\n", &addr, &symbol, func) =3D=3D 3=
) {
>  		if (!addr)
>  			continue;
> =20
>
> pw-bot: cr


