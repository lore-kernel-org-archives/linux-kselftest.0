Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7338D47DD4C
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065189; cv=pass; b=ozoOFmqu+2a49DeUMOUAV+TS8H0edNQfbcNJw/nsbzg1FkN82ijrHeMyfe30eP/0UvfXGqzOAHajaIWcbVty/fj6hZFUQD49EhAJqA0cchhV4dbYLQNAXIF+/d+cgmCkXy5fdg2gV64jSts/PCOGAD8fmCGdeU3/VvRtkceJ4uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065189; c=relaxed/simple;
	bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQatiFqGqR0v8yqDcglC7TCRGLcs/4JUXshQMmp9PXluAxrHgwKc5quK8MrPDXxg33McrTori6Lc0QlSDjSxMODLcHJ7cfMF2mDONI0haIp3iEdBc2zlh5F/CRvw8n6//NWlFLUkRZkPQ2XLiyE/Nr821GBvYY/eVBrNRNomMI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHWieLuM; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHWieLuM"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c98928e4bfso4495eec.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 10:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065186; cv=none;
        d=google.com; s=arc-20240605;
        b=GsHvRYZbWVVFMq7vVMAXsD6WJvqDY2d1n+FLWqt0XQPbRNRAYuuH52jEv+KzE/r89M
         mo+x4N2tTjYvyH9BoB0VF1YRr3MnZvMWzzqLWie9FdmOioPrzqP1eD+XhDGBxfYGQsrT
         RPw20TW8Yt3g8DJdHH39KMcVf3qXdW3Pag4jH3KEfRH1rhX7tEP0xQmM4up6pVPRZ7Ch
         fmurdYb5nVvrj8pTtITiD79ukOKKCAEqCdwFUdZJlssLRIVqpRpo/7ZoKbybQh9vC+Pn
         UBhf8qn8rl3VC/0GzbHHQjWcWfNR3lh9Shz389FJ/Ck32JitGC4uyrWNT/SaroRROurM
         5DOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        fh=KhZMDpVje+TG2JD6qbXoKaOS7GBghrdWaGD9Vpz9Ik4=;
        b=TCyNTXEiVpKxlER9/mHQSwCxDpdvRDa+s2LdRCzKlXGftb6bYDJ6N/poOYlHuSGsaw
         6EVyUOc1L29xPawLuEm5XEpN25byn/4c0Bx8m10DH/rg8JZSS3AhpPvMNm37SOy8bMgn
         rukpHkFukLo3yRZZLCNL4NC8BHqE01YMm4k2UmZyHCkTLD2Y0VGoOa+kKYPPCJ6hTDfd
         rHoHAJAD3XG9QQR56dQxIf1iwJTjRSXq5+kkQE1vkTlMhIomREg0gibq7Mi++bLQahiB
         fphYkAMG2c0TuFNN52TAYQN5rDpITezDBmWbcQMzacEy2n2l2v8RkMeYUUt/eSAfSJZf
         7VAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065186; x=1775669986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=MHWieLuMH/ByIIbgNAqItzRtGa0YCLeZZ3sJoYjxtAmdptV+B0FY01Sa9Zy4qL76Ic
         j82EBQ+pmxUaafDRoehP99t3m/Zv5K1RwSlO0WGJzoVzMbKQ1K2/hN7LiW+j6xe9e2fI
         Qe48XqY1X/x80hXa7HqlTVfURdWVK8QQ7CZlpCi8Vl30IN5v//X+jIR6tSvxhNC8V1BX
         G779+LCZiJh4X/19XUjup1EKn4XzI8nKUs442PSZUfpxP5Rq272WIYw2YE3QHQjZAKe1
         nzSWR9d5uMuWppW34ZIMY7LLBWaKUO5J1IO7l/SzzvCWh7Ymqn9OQh9dqDzEk8eAiVVS
         jWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065186; x=1775669986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=DFJRZMLlPHPeVIqPhf3uxzbHzXu3iDIfhulrVp/IAoXWoGUulyKD11ENQX+3IulT+B
         jUtvvIH5hmeWSk2Pzg1l8p+/JJU8fpCd6doIPNL9ozELBct9LRAtK+NlejFdyg4/oVNZ
         +0fYmBUfmXjjynZLbYN8TlxFRuscoyDXZLx8S+EMRluDVxPqaLpoDXjMXs/mJwWye7JP
         WsLCwAiBRqmSZuPiX5M2lPVzmQi47VxPDuiJiPL8udC33ZA5px1jj66365QueAlb6DHJ
         J/Zk7MMlqzTB60V0NWK46VorkFCBXsG0/Y4x3PEBIZrxBV4ofMVDu9o7Jboql99Aj3c5
         PNgw==
X-Forwarded-Encrypted: i=1; AJvYcCXC6ZE8/5wAetetv6Lfoxx3vUDYKnPg+kiCTj71NpM05dPJ8sHkQ7DWDAE3DI9jOb89Q20rD0LM6+ePKIA88q0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAi1gJvVtVhr2YxpmT4x3vMPm+42g1byk+W4ITTsWOAjcT6bCS
	+8X5h4rgmr1TWFD77J34L8uymEh+kFqTppDNcZqNsukE07EqnUE2LsJbjY8FzHW/C2W0m6txlI3
	GxHw0hlCaxf2cgi4GT1ROYDXMoULyznE=
X-Gm-Gg: ATEYQzwBWigh1HPDgw1rAHydd+8yQtGZtt2XacNdXY2gaOryJUeWJ0tK8+r6Rqz0ac2
	V1Q/zsRH+QlAsuQK+Ed4vtPcqiZXt/YZI+53LjouMNsSfhB65f611wDxAAjr3rHoRG22KkuyuZA
	07TQKWaMDvnaZVVEXqUHU7znQCJG3ndwInCWIuLEFDIuIPlo9MuSCrZn8vECucpnUZMCHKCr79Q
	4JrFnBWCuhXcd0EwH5tICsPDR18HTJMWflY8h56RObWvA+hvj8TG7W+CoN8kJx7cU7hu9JQkrdF
	giSM/+7ZlELqTfa5GCQnzZcp+OMmTme2KtYKh/7mOcGrMXXZx3niXpuifDQjb9XKmlUiN7R6uxW
	ZQgAITukFvnZm44SJg2Kmfqg2/+4lq4OTNA==
X-Received: by 2002:a05:7301:4586:b0:2c7:2cac:8147 with SMTP id
 5a478bee46e88-2c932cb3abamr970192eec.5.1775065186457; Wed, 01 Apr 2026
 10:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-10-ojeda@kernel.org>
 <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
In-Reply-To: <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:39:33 +0200
X-Gm-Features: AQROBzBO7Aafw_pbzha_JEZl4Ht2QE7dpytXYa0WjnL8RQv-FxGnezpSMqEOLn0
Message-ID: <CANiq72kSYFiS6zN+VLs2URhAeHy8_-aEXki1pyR0qoj7jO-qSQ@mail.gmail.com>
Subject: Re: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix` workaround conditional
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Okay, I see what the comments mean now. Perhaps squash this to the previo=
us
> commit?

This one was mostly to ensure the workaround was not needed anymore,
i.e. it is more "optional" than the other.

In fact, we may want to just not have neither of the patches, i.e. we
could just remove the workaround given the timelines of the branches
-- please see my reply on the previous one on this.

Cheers,
Miguel
