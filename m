Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E5A3DEACC
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 17:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782842361; cv=none; b=nMZNxkfHNG9pmAR3pc557Cktobm58+dLdFdECfy1HVn5DKf3EicDlZt+ksDOVZQ4gHZ4AmHz6xMZhyq+cTmholWfPF8jqJsN4OtZytTCRVZVSonIYOpD7GpEbQiPqzUIU4OlV10Qwg9PvidqutrUuS0IwZ/KgO357U1yBz081zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782842361; c=relaxed/simple;
	bh=x9CMoGNkZpcb4ai0XShbV9IZQjov/vBIzAOp2ZoeIDc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qoDmXf3G63/rgRZsXU4bhkiDeRmsnhGqBXRaLs/nNLcSWE1eR6ZWRmUq+/SM+7K0Ssk3uPS0yGhjqrRdPUA+QlyBYPzj3ScHG51gzmoRkydaVxCiNVO6bvaNlSLpJqbqs9Tukin0MmSfOUxwaL5DA1qzR5586IMHSgYS8uGdNnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahNkuyAu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahNkuyAu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b7612475so11988145e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 10:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782842358; x=1783447158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Us+CXl62OP+IHnxEOFdUPPagDbtagb/X32b+PDoHuVk=;
        b=ahNkuyAueIUHdlOuQ1dTLfGjq55Pcn51cuxihj/JIuLwmHYRdVcgPVm/3R6tKKIncb
         7eh7uCE3T5faBurKc6TS10BbKlJ49lsJVLgqDPnPYj57UHx7X8NYN6y+LvKvZgGW1Jgx
         p7CFuMYuQGJje+Ql69a9+0wQTg8gR+twSLu+Nte04j+cmuV4LPQ4QR7yhl2si/KgfDtO
         e+VtNv5CydfInL2RsWtglHCshIDIbgQA7BcoZoTDD4LZDgsfy0rlB7CekFxn5V97FuIN
         wLXSi3zGSfPLbKHAdtRujUt7cw+lb1ICDKf1qh9YRzPwxPacyeLOvZ4swNMpOw9JgoN9
         9COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782842358; x=1783447158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Us+CXl62OP+IHnxEOFdUPPagDbtagb/X32b+PDoHuVk=;
        b=WMrUva282W2WeJT0PzzgwglpVCb4EqI7qVHgzGy6g0KgUQNQc04Tc+yeFwdmeuNDHs
         YuiB0NhdLs7RbclruZf8RF72/Huzay52bBzxE384gZSKAbZc6vJpRpgzSZZvBoetNePS
         DzCV0/oxrjZ+tREzFOdgqqQQ2/Wt36/codmEGfI0YDL6zc6ejNQz5evEtUFzonjy1qvY
         j0N1kxbz51a5p1r7KgXIlxkS9Im5r0z0UZu/E3o7H8sKMpIANw4sOHUj2ZEwS9AQtLL0
         Ll0yUc+XPUGuOOULetg2i/yUEpv8u562V+IM3EwA1HDy9Nz/7y7iVQHYpws1hxYLkHp5
         aWnA==
X-Forwarded-Encrypted: i=1; AFNElJ8TgsjmZff7FDDe8S0ndrwSlko7T13oiUA9TS/e/ezBJ/wELcTGjOEezZf6Zpuaa6xKKiAAi+CuutQ4GGBgPHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuLJaaQpO9T8a77sTZCe4X7mwdO+qLo9JLzsqHKkN0KjFY9ntP
	x3D5sJ7u4C85+mxEn96K00ydb8g6lzf2gcf5ZsER/XOnSXdSiZvgbYMF
X-Gm-Gg: AfdE7clu3wSRR2UTgHuFYEN7AxMkFsKM++gurMxnNhIOa5Atf+jPbQqMztDR1q6RWkV
	t7O46Mn/2+Ed2ejcqFhdfB7nw1myWRsPPDFwT+e71iC+gVGwHConUtXRurHMpsW9k5/dcyyqkrj
	5uG3q3HRieGYwOVPgd79Hjm8DHssc5JTpna7DJnSx9Gaqq4IiUStfIfRrXgxfTxjV0Wkno5melu
	BT8xBO4OtwTV+kkbO5+g5Mn/JC5bOzy+Hu9SNfBs1SDSaNjUlJTwuQBvqlTCbGpArGLVLAc+WFK
	X6ToqnXgZjb1aVIyptlcJE3sLn3RIRrvkqGGlFe7ppVn4D4WwjjMds3VIctg/piO1yBizOL9owx
	Ph+cVSouzy7LA4Pewwuir0RfwzFTATLrImnRtAOcN2oZio0Luhxk9goRjZVVi9dk9t3PiDXaDlb
	8M3fxNqHC4LsMJ6bjee6DKAnGOcHhSZlyGeZ4JVFYbs1rnzw==
X-Received: by 2002:a05:600c:a06:b0:493:b811:e549 with SMTP id 5b1f17b1804b1-493b82b61fcmr66519375e9.29.1782842358265;
        Tue, 30 Jun 2026 10:59:18 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4c7f90sm11943955e9.2.2026.06.30.10.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:59:17 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:59:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jann Horn <jannh@google.com>, John Ericson <mail@johnericson.me>, Farid
 Zakaria <farid.m.zakaria@gmail.com>, Jan Kara <jack@suse.cz>, Kees Cook
 <kees@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, shuah@kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mm
 <linux-mm@kvack.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] fs: support $ORIGIN in ELF interpreter paths
Message-ID: <20260630185916.5a694895@pumpkin>
In-Reply-To: <20260628-debatten-vertagen-amortisieren-3bf518773e75@brauner>
References: <20260622043934.179879-1-farid.m.zakaria@gmail.com>
	<sfv7zc6jboy2oxv7zuyofysas4ncbzenwsuzveiyduisfr6i7q@mx23er7uxdbg>
	<CACCo2jkDuwy5w_yhX8833m+s-rY736pk8xtKjxg3_y_7BCOHeg@mail.gmail.com>
	<24420045-a6eb-4999-ab19-1e344eaba8a4@app.fastmail.com>
	<20260625-atomkraftgegner-hunger-kursbuch-b452ff2becab@brauner>
	<CAG48ez2X1p5Nm2_sU=SK9wUusUO8c3_T-=FGrrOhkm7Kn9Y_7g@mail.gmail.com>
	<20260628-ungeordnet-orgel-stechen-36dd64038541@brauner>
	<20260628-debatten-vertagen-amortisieren-3bf518773e75@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Jun 2026 15:20:11 +0200
Christian Brauner <brauner@kernel.org> wrote:

...
> In a way we have been doing something in systemd that goes in a similar
> direction. As of systemd 261 systemd _only_ links against libc and nothing
> else.
> 
> Any other shared library is dlopen()ened as needed (discoverable via
> elf-notes). Lennart wrote about this just a few days ago:
> https://mastodon.social/@pid_eins/116781776665322560
> 
> This effectively minimizes the work the loader has to do at startup. Imho, your
> effort with wrap-buddy is related. To me moving the loader invocation out of
> the kernel and into userspace makes a lot of sense to me.

I've done that for libraries that a program doesn't normally need.
But it doesn't make sense for a long-lived daemon.
The work almost certainly needs doing at some point.

The other problem is that it is hard to handle symbol versioning.
So the function you get may not match the one the header file
defined and you suffer the consequences.

	David
