Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3653C3AB
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790066; cv=pass; b=hsq2Fkp1ZQCvx/lR1FJdcT9KVSRWPa9RiPOn93Gg8MvsygCq30b6WwcMphOJl8Ly0YgX3YqYuu5HMsoWE3Au/yIThQyOnsKvhpllHRl5JpkOV2w5Ur1sZw/IX0mqWsWEf23cKBeYm3UhtQ3GF+pooiwTGqnxge/7A+c21PLNbZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790066; c=relaxed/simple;
	bh=QIPKB89nXgDV1cfQB+FMow3NJ0Z/HH87YQ4Av5NDtpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Si3+UqX/ZEoPhz9clM1wQfUbrP25iFHtiqQuVu5FOwo+f7v635jgEWq1C4BNwa34FIg/uCpX8tyRKuRhVFDHuWUJquLyH6fFmqFOM6fFNEk1BT5eLFoxP7LREi1dHuk7WBPkbPe3USqNKibq5U7cmM57KeQilByriTxZKI6VJDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neLE9dAY; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neLE9dAY"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34ad8819612so233442eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 10:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790790064; cv=none;
        d=google.com; s=arc-20260327;
        b=JBeLQFzsKzFUkcgOvs7l4cPkcuoa8B23HfL9NSWotktSc/v3fOBBX92rzO1c7I7zuQ
         4r5dG2Wp9W5p/fWwlo6a0GAf2lKklpdpbnXCKrKeMAvlNnViRHGlofT1JZg/6qA5bXe6
         mkk9NSAJOBuonZlvqWY0JYOl0DALexFgZgql54WG1GID+9lrye3I+iIXVBzlWJDkF/Lj
         tbdJLHEzhn38FJEWYcGjYTCAQg6Uy2kiRkTjHK/tnz6RLMDwfXyuIe6coromERm/nEUH
         x+Y5sW0SkYqJJk2G+mA+RslTbnNCvDh6mFdXedia8u5Isn42/+H0V/DkqrEAtRDfionr
         dqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/B+OUO+2MaSoFZSGNnPwJro1OL5Hi+FQwtCFW/qOfg=;
        fh=sPcZBy+jjCCNqYLcUfULXA29b3dwYcLmen31TBj/7UU=;
        b=efQgMWbQ2oL7vbJDpKUjwv+fyy6RYToQK5dDREq/At7hL6b9fpH6qtsl23DEwoAUrr
         EaZ1gZ9iqQr048IbvztkvyQNv+XshYJw3I5RKhphapoMB8NZg6fDcdNAuuZG6BSZ3JbF
         kSeB/5lRZfbDYqrfAR2anSvgUam/k593K40GICY+f6cfxafkIP9MbqbgblkKyEwWd/6o
         0HIB7/za+ZzTeEhUH/vbmdiO7WKwnADaySkn1Sa+sbhO84q0TlQsbmxhUzbJhEKzewgY
         pCuO07XeGLsxf6gC/C0VBy0UpPloFeICAV6arQ57tlaVdDdpq8IEuEZQplU6jRfUrcW8
         08Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790790064; x=1791394864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/B+OUO+2MaSoFZSGNnPwJro1OL5Hi+FQwtCFW/qOfg=;
        b=neLE9dAYSQhGiJKSU7ZKOZN9I7n4pWI3QqWnC2v21t/EDQHwpXabp7zLBYv3ponCi0
         S8lOPRFP9mB1kdhYrxGm+RYWzmiFZCOCJ5n/os9Hr1lsLQfv8kvr5DWqipoRc6x7TUAo
         X7u+UleIJrMAirYRxwweXC8AymsUdIYEC9vhev4tzF4PVKp7PmJlWiRtmd1PoMAuVuw8
         0Sxy6Xn82QW9XsHSbjL1A/251rWQpF8sRxEAvjwqBxgevENU5Bhm/IpjdDi2MCEO+rKK
         msbZ7Byr+RwPUAihqvJ8j80dWjdTHjr7k6OLMWdgFm51ZE0ZdfmnlZ9FXYYMRVzyFA5C
         Rh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790790064; x=1791394864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/B+OUO+2MaSoFZSGNnPwJro1OL5Hi+FQwtCFW/qOfg=;
        b=LdNCud0T/uwBuFayGy5cGU6XtKdXyatZXwRJBbXzkX407yIsvVgQB0GLga5s2zsAXx
         SpLTSwYalf731PMRSyGADWpQlfcTNlkmiXaM7U+Ry1WhBRdohXqBXedB5NWUV/kwWwDa
         PIXfm3eEJE5jJlrMEw14WvcmnFV/oUjQxZiUgInOQQk8kxkFcwUtx7RyUgrj1NU1vpcX
         jX6dgsC6ThcFW3bfFNmFj58tsl9nmuBpjnNWQ69OQIo+1Wwg1Aecdcwvzaa51V7kB3Nd
         59yTOikPvZ0X43z9JJGVy5I1+WZPlCP115JkZ3bIplKsHzbfKehRNiYIe1h1q3684YwJ
         /YoA==
X-Forwarded-Encrypted: i=1; AKwUvBzVRf+7or6QHmWkK//yQMNoWkIDidRXE/15abZqKl1/X6Z44GF0BafcgyBMyD7REjKZKSOFyYZk8+hu8q+YxQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4u+Xg1T1pTp29b9nqpPnNzvOaEfrTJCE/+X6nBfV/xxnU8tPx
	m89Saz+b2UVNO625lBUhHCj5xpuKQxNVRtRz7+8oisdHlzR/qHU4LvmL9q3xqNiDQLrRSPmpDlD
	tdZMHCAZScdrbqWQyTQecTjOGpbYjN0E=
X-Gm-Gg: AYBFou2BxK02PcAqyHuW4qyPuZddVQT0gkTeNXlb8n64DsHE0935Xbn+Du62rPiWjeq
	TrTw+AFpUE6saxNIfDYmUWFHK+Ympzg95/WNOwWD68hplku5P6EELf5b77baPCziIdJdkagszsa
	pYfwo2Vd1eLcdXf4WVqE5aLtTXLDD815CmgBL/yjpJgEvDraZYClKloEG6zPJ49HJsE1ew7syci
	IX8QDv1bSh5zxUIa3sNjp/cdtGBRs3kyZTixiWSO/qSJkDwWE/goAGvgBaIG96npQ09Kc3Ah6Wz
	PI+JhRiirjTqt0AUqdOaV1VeawSalaSGp1vXZReRRsk5JJkc/S26tOKzPw3+xIneRTEYG1czZM0
	KwkjstmBA66RzKKlkQC/4OroXNLOiOwO3tfZJCiroV9rAxeoR/7e0iinVMQmcP8DgUFmnP5Y8E/
	j7IohEDBBNyUn/FGHaclepMCXWZuc9iU55QqEP7D0EaW2ToLa/kWOaVbcWeOqG9Q==
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr4199997eec.1.1790790064283; Wed, 30 Sep 2026
 10:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924005052.2805129-1-gary@kernel.org>
In-Reply-To: <20260924005052.2805129-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 19:40:51 +0200
X-Gm-Features: AclHuK8-tNSnrbUegQmqadgpN1Vx-fpMXj_ECffz7b1Y1rIMfXI_7fEe_oGZOcw
Message-ID: <CANiq72mjeXdGB14ySO3RyiRrLtm2wQK-FJ4VkMSiHkJsGY-3rQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: doctest: trim function name for reproducbility
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:51=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Currently rustdoc will generate function names like
> "_doctest_main__home_gary_Projects_linux_rust_kernel_io_rs_824_0" for a
> doctest located at rust/kernel/io.rs:824, when building with separate
> outdir using `O=3D`. This creates overlong symbol names and is also not
> reproducible.
>
> Fix it by doing a custom remapping to trim it to something like
> `_doctest_main_rust_kernel_io_rs_824_0`.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks!

    [ `rustdoc` already remaps these paths when we use Rust >=3D 1.95, thus
      this fix is needed for older toolchains. - Miguel ]

    [ Added `TODO` comment about the minimum version bump. Reworded title
      and comment for typos. - Miguel ]

Cheers,
Miguel
