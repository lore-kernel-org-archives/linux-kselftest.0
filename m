Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613072DAFBB
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802150; cv=pass; b=dBFDvKNN3xCK+mgpoPw93pbJiKREgNMCfVKMH4BCjG18wVZ59dQ1F9LBXmLfpjB1+y+Xs7nxOjrsENPUe0x8n35jRnXLnFBejJEuULyXweZsl7zOHG56QldNjEGP/2J6zzyTVwByympgTkF8qQVSF+esW56gGI4LVKC3ss8UMUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802150; c=relaxed/simple;
	bh=85uhO6a3UX0RUPOdgER5qc6B6LT1jAnA2i1DKn1wxlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6PaEg0LFp/RfKAirYBP1Q1gLGxs5eGPCn8Uk7azxYwGw4b7/KfTOcNTkHSWTvy38HN1tbpaW/bOuJAvUEDffF68c2HWjDdONgJiTIZFoESnAXQ/tb1DaCRZkphqqZDmMbM7RySoBw7NJffLnGoRxC8WoAyf0ZUXj3btWYnMAmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lGgz1XqN; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGgz1XqN"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-126ea4b77adso9762657c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 23:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775802149; cv=none;
        d=google.com; s=arc-20240605;
        b=G5nHjKZQJa8hbwne7uMwZplEGhkincSx7fKj+8dADh/eho10svZ9fVZeQAmZBomukm
         gqZ9Xf1UYzIHvWA8XxeFrIgET/W5zlf+RGV9qCO/4zeEfMAhczAUe2yvJDKB0D+vlaez
         wZeoeG0s82GOTiFZszS0H5pevHyydAANuPwj89WMahiEjUxZZiX/nPXJXnGK3S8QdTR/
         Yct6BQ679TIUXUxwb/AjDco0ZxxOh4UWLk2+Ln5LMMrFGeQ6LZMEODtgqb5HH+BGb3Ip
         R40hrzW5riCDCwFMmzg0sivKigo5n6oEBt/paTCeoCtZwHSchZDqn9l+rv5ptg9uG8nd
         s3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=85uhO6a3UX0RUPOdgER5qc6B6LT1jAnA2i1DKn1wxlw=;
        fh=mcfxYYHT3rxyDVtNji4NRGg+SjyXhsQvvX0xQibCGxg=;
        b=VrdjUyEbDCvA1uZmlN+zM+a11vXQTKofC3+qCOGh+V+DEfQDgNoajfusDQswnk1GLh
         nTfJtzk00IIHglv951RGmBD7IuBr0ubVoyM6NLWsmZGTkY5/kLX1cVteFjUS89g0fN+a
         PK2GS7UK+62DGgVQB0JGb8yvbEuSzDAN4sp9F4b82PFK4rZNteMSiH0Q6PZoGaP5F+9i
         XayCriN4I0vRFVdkUR/S76glk2q37kz5y2ncuk8OBTj6sN2S4arheEaB2MVNcHwsUUdM
         hX1NGpB5af2gntDQO3NtmfBTAJuiA9e8BKRsVgn9vRiK4yNKvicytTO5VyJxQyzch/Ee
         IZzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775802149; x=1776406949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85uhO6a3UX0RUPOdgER5qc6B6LT1jAnA2i1DKn1wxlw=;
        b=lGgz1XqNorVvsA2+0doar2mPnIRP6qR+5XQXBUOaZzEr7NIzlUSi/JLB7NtzRs3arn
         FUS5PTxq7/WKmVtNhLqksm1dev1aY7iawcusGJhD+cbS58NX5lb/Dby/Hbksth7JBC4j
         7UPBAtTKVyDbu2aSN/p5cYULQSehyjSl/YPWgEK1clsOcpjz4HEeTfB2GKJvQ3PTSS1J
         eymcLYu2sBXCsCOs9BFg3LwdDCgAqvGvjWt+3gYvtSMwhxI4TnDZ1WOtUZe7GQXgUm5t
         0qGWMfbfiKhNo3IkSse5kIXdSPzgYjwueQDw3gw/VatJ47cbNShLZXek0lZRqUEBPgB1
         0b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775802149; x=1776406949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85uhO6a3UX0RUPOdgER5qc6B6LT1jAnA2i1DKn1wxlw=;
        b=UeLdK0271Itn/K6sSp35v84lVW9to3sTEFlT/Ms3vKKMQp/P92o+hS/OeV7O7QdDrb
         NpX5S040qu8XcmvJJ2XGDXZzHqTkHBi/O4VS/1VMeflEMvEuUHR71sc4H+g34McOz1gg
         G61WPR/mTJC5ZnkXB001g1/d4T/7MipmFJYNgJflJdq2ked64Wzh4+u6j/AhCYqw8v0m
         GeYIldqzvR/XXIkbKymqUQKgZmcgC3U4YeCDmLP7Mtspeaj/O0mh4iRS3SpWVUkT7TtD
         lB3uxjITxOwaL3o8hsPjc6YgMGYLZRCKlkqJL05GmNXYGelKVTDEOEDYzO1AWUTiXLc+
         guIg==
X-Forwarded-Encrypted: i=1; AJvYcCXRagzUGLcpE56zTYOqVBCPnKBU2ydeG8K9NYe0BgcFm+f3ZExunH5rFw0fsgMYjtTWD/oKExYQEALVHcDZA+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFhTGeRaunJpgdG5Bpa02g+v2VzRR6rcGcV1ZuO5fxb2rW2FqR
	Gl9O6ngErOdrN42NEJQONit5G7FL5OF6FekPNsb68V9elvq2pSlqlRH6dMrV0BpQ2IRIlTgDFYo
	rMNlUvGjCa5r14P4UUoYnrNlSSHJOGa/Cy8LIoJ+7
X-Gm-Gg: AeBDieuUzIFPb6EamC0tTJgy+yyYA7mDMANXb0TgLbZdVmGmoytr/FVI64Alitye7UK
	Cp7A/k7iG0klqZ50DpoabT/edjOOWWggq/F02uqcT3QJXjnPMKjkz/I9mrAI12z8Uq8Q39nZrT4
	xLwXNBmS0nEGRNg8mvwDgcbl/XtIxg7sShvZehrx5p5FSr/yrEG1pN2j3VHnjdWhICiCpW/BXyg
	Yy4Dhtt+4THz5etIyNqsupBoCTOm1xRC0S2PTZwCnQK7C3hft9SIjr0DQ7rn881wkrEERuQRseb
	BdcSl8M/plvT9tP4vJMexQ2N2MbCd18LEw5Z3GjcUz7sDHwYLEnK1vl8ZU3T3G0Nb3ZInpXZaYf
	PhCsM5qc=
X-Received: by 2002:a05:7022:2210:b0:119:e56c:18ab with SMTP id
 a92af1059eb24-12c34ede9a4mr1042759c88.19.1775802147879; Thu, 09 Apr 2026
 23:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-6-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-6-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 23:22:16 -0700
X-Gm-Features: AQROBzDYbL64JYoKRFKy3IJSAfw3hVgsqBRz8HK8WdsFdVBHjeQyIk_Aq7IUKjE
Message-ID: <CAAVpQUCd9jFcuRc2iW-A6od6rO=iSvOsoyDFKfVyV6CdKAxP8g@mail.gmail.com>
Subject: Re: [PATCH net-next v7 06/10] net: team: Rename enablement functions
 and struct members to tx
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 7:59=E2=80=AFPM Marc Harvey <marcharvey@google.com> =
wrote:
>
> Add no functional changes, but rename enablement functions, variables
> etc. that are used in teaming driver transmit decisions.
>
> Since rx and tx enablement are still coupled, some of the variables
> renamed in this patch are still used for the rx path, but that will
> change in a follow-up patch.
>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
