Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6501735AC24
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361224; cv=pass; b=NuwssoOteKlFvM7WcAzTUcWRmSsAsVrwfno+Ee/WaL1C7ZU7bPhSAPb0CA7lBee1//Vou0g6M7xzjV1coyDyA0JKK/XwKplxWnIpn+lN2WpDbQ3uWU2P0tLoN9WVlitEXVliViuqagVT0xg+xDJ8jfatWtwsmolV4Ay4OGZ+6qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361224; c=relaxed/simple;
	bh=uMrMUI4UiH1bTD08Nrh+4d7dEyXFH++5+rlUyuRsk6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLc9jiFcYZ+vN47jsEKYm/WS29cHm4SWTNeLXhhp+MdNHxGL1EztVWRuHAmtWyT9SzPOxPjYGIfV06AxAnvdEkeZHUxx/5CoZzEN64N28br59Z0EtTbxnmyZVxkNOHlpBs7eJw8kM7BzIi4C/VkGprfLw4XOL4B7OH60O9fz6i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=apabWkdF; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="apabWkdF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ca7aaa4b85so30889935ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 11:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783361220; cv=none;
        d=google.com; s=arc-20260327;
        b=dTDdYwN+VjR0are+N5tx9rYDeRyqAJRjMMF40eTFKDPJ7WSJ8w8tumVxODSvu8QFhl
         r2NOw2GV7+wI21JM997NFDb+WctT/0SY/d0iYap2XSUAnw7w6DU6R56b1oGHl0yi0V3f
         JV0dTD68WyPGoRJteeJtYK1k/72CK7UrzjT0mbg4PaQFUHI+9ASMTd6KieYya8kmK6nS
         YRNxDIwnlp1NTTPmBx/1HftV42MPv9VsKuK+xlz4eCgZ7hJEKXxlS9+8bdMKNJJMLq7H
         U5M75tPDXR2YaC56j5XPWblTNpONM7nreHRWcwVbevanQFa5X//cbFpjNyfYoYpr6psW
         zk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uMrMUI4UiH1bTD08Nrh+4d7dEyXFH++5+rlUyuRsk6c=;
        fh=QwWUuhcXN2SlhEc4DZpXuG2sdF928T/DieNw4pcrzkA=;
        b=Tdm9mwso2M2DIn4JqZCjE291lpRXlIqre8v2PDjZsEcPAzG5Uc7p+PROibO8QLKa+h
         WXjHZujxEljAdf4nsONQqzUj6QMlDu0RIIwuVCBnM2TxcHPxUu5YIXie4tWKRuQ1DMPZ
         mDKEaERAPUdmWGP+3UC/BSLsbBGVAI9Cyf7JdUsZINuNSFzeQLi1Hskp2duq2IJurRkx
         1u+IAe8s7iK3t3dbE4/4XybM1txP/d8d+y6rJ8LME9U6WwvY32cuwH8LbRVIGp5tGfna
         MvTKsvEpk39M+e7QwExMXN5oIee+UbgAQ4XT1l/JeC2I82iO1J3nMSKGCTnc64C6tlYW
         p4Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783361220; x=1783966020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uMrMUI4UiH1bTD08Nrh+4d7dEyXFH++5+rlUyuRsk6c=;
        b=apabWkdFEDHu8rUvNzQwbs7wcYakfoT20KukizTB8nRu2Yk9TDl1cJu+LqO6XkuEVM
         SdFDglMo6vze4nRvro4Z1P+5zlhTCaY54WoKEwYIGPEA8upZR9a/GaPswPCDWoZNxrnP
         yHB6YXOsiUwBswO07p8ufQgSkO9kFGb+zm3331kHCeDgj2R+L+AKmIbAVvz5moIUk7lP
         XvcaJqotSrobdoK7axTSG5Dz/q8LNwVw/hbUX/IjRUJFB2KVotNMeAxmADTF+PmM5rKD
         5zPsqqYnPIkQM79T3PI4T2aVBGG4cOKjROb38TaN5f8lUqHt4lQbXiMwPpZfnEVHPkgu
         1Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361220; x=1783966020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMrMUI4UiH1bTD08Nrh+4d7dEyXFH++5+rlUyuRsk6c=;
        b=EFkfBR9YjsX2tWlBuv8W2Igz+txDF5KAGhPKH2X0p4Rl2vQyNMWhWGhkWM9VFjqdo/
         tj5a41sYIjFsS+1WLSKd9vvKG4NpAPtH2WEi+gA+9EPhsLLg1043FC/T1vZcKTAnMZdU
         wPJUWAIgnPRCacQBHdo2JbrsD4npHtmTXhyjcNIIXvxDBvddZe3dkmN2v7qxUXOcw/gO
         1Iel+L+vLJS56kRZj2aq/3xbnfQAHNJsggYONjDzTzSf+4yZrwQ39HmbZOIBkY4BgfVv
         VAPCJeJOW+KEdhqLur8mB6ZyjD4asFNwfSmMf+fB07ZtdT69wFRO157a9yG0UM3lHDCd
         TXNA==
X-Forwarded-Encrypted: i=1; AHgh+RpfrcZitQ7WS3PWStjPZ0KhYwUrtNKOZYLBE3LeMn3SZpgBnCjHvGXkWsBbHIPUD5+QqfRoX9VzSTPGE7Y6P60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6rYc5fnsoQ1fFbZEgI060YF+RWcJv332nlYEKhwfYEXMvwvG
	AMj89uJmU/Qe83/BySemlBXLAiS1qRnrXsRkCv3sh2r8dRcnh5Le7ySHmdKSNX7RbxTxxBAXGWq
	p9MkOlfUdQbfSObuytlBm+hrCP+bQWfkgQkfba8xt
X-Gm-Gg: AfdE7cmm5GFwO8oFEwZBIVIbLh3CFiIVRjamiXKzRbwyqHT386yvJxJqAeGMsbnUrsC
	qfVuT+EvIALZaltdeckxArRNL+HELpSfucRB7jNKibTFFFmcJXZcb4dryfOe8tLAQyU8ZWX31ic
	DBZwI+paR47excvoKqRfSsl85tGgEbtNH4GzNl4iKpwbHqapiYfoLhOUx8vm4GuwxEzBnGud661
	cX7cNi/7Nv7bC6rANtC0jt8vKm6Z2GPnSiEn1V51I6ChOobHIqoXbWlVc2GxUiAz/GEcDO1ngjo
	kKC3TujyikWXWGe1wH6+2d09FrIl8L0ILr66yM7e9N0aabLc2QFkbJEjoe8aWIwjZBoZjR/4cfk
	bJ0HkGwoXLij8e7B0FzS1fBtPnKsJs4Vy1WCfuJc=
X-Received: by 2002:a17:903:244e:b0:2ca:cb8a:f26b with SMTP id
 d9443c01a7336-2ccbe3f7890mr19740575ad.10.1783361219085; Mon, 06 Jul 2026
 11:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175228.2468730-1-dmatlack@google.com>
In-Reply-To: <20260706175228.2468730-1-dmatlack@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 6 Jul 2026 11:06:46 -0700
X-Gm-Features: AVVi8CcBQh81dXbjkWyXxADhbwcVGrpYq-P2xONh21cgosHQiIwPIcGgha-co4Q
Message-ID: <CAAVpQUAgt9TmpGMkWC-sA8tOPyCwM=T+07Dt5FazHk1PfWmGGQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: harness: Mark test fixture objects __maybe_unused
To: David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Andy Lutomirski <luto@amacapital.net>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Will Drewry <wad@chromium.org>, Aaron Lewis <aaronlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:52=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> Mark global test fixture object pointers __maybe_unused since they may
> not ever be read (e.g. if fixture variants are used instead).

Not very accurate; using fixtures w/ XFAIL_ADD() does not trigger
the warning.

>
> clang made a change to -Wunused-but-set-variable (split out into its own
> subwarning, -Wunused-but-set-global) that causes this warning to be
> emitted for various selftests and can be upgraded to an error in
> selftest that set -Werror.
>
> VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> selftests: Add -Wall and -Werror to the Makefile"), and the net
> selftests builds have been noisy due to -Wall.
>
> Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked p=
rocesses")
> Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> Reported-by: Aaron Lewis <aaronlewis@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Not sure why Shuah didn't pick my patch though :/
https://lore.kernel.org/all/20260530054722.271157-1-kuniyu@google.com/
