Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921152;
	b=qUYhETEYCH8k0I6qb8bomobn8BG1qPlI9IeBwCUvl6BxCEB2DEY7YrJvIn8gCAwc5YQm
	 5ePDy+IIUv8XsP3SWhpBAsXLN5DTexdigN5vkEcCx+1LdqolpTwcBVf7yRF/2hecAmMjc
	 qR9qxE6wKplmACXB3euSzpbD5Xt/7q710jj3iWLxJBbOvd2d7DMrVIGbEueEPQNUhsm2u
	 /ZWSGgtitCvvpAraoU9F14LS8fq7PbglPN69Ou8ULSWTIvFaAtByvQ7PmAkERxc9lspKh
	 ZYKtLM/7J2RmVRGygZVBnPdz87cm/Fuvc5k4BrdiD+lyd3JRxbnAW2eOqk98ZgugWiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=G4E5w3vIfYrEz/focXkw7N0ugWTu4zF6SufD8ZnoE6g=;
	b=0OVppt9ybi6NKlp7Yz85ukJPNn0Z42ojjSpf8P/ZP+7625yuteNV2OLBasoNeiLDPHKI
	 PTukVLwcNhbKeolJCF1LrWcz9KeVKsCEn+Vd1Qv9zjlUnYRIectDDuLAshx3Nhu4jw22G
	 q2DfWa7LZtvra/zj8qFI0v4qUrbnL0aHQ9+gCi3qebl2T8bFnRBy5tYtaQPJsaQRPrWti
	 AU5iQ9KrthhwctusyaDyUgjg2K62ryxL0NJWVCqN2fBzW9nkUtowdNl+tcpzHmwqHfJu8
	 p/l+wDgfjIeuGPcq/Dhs8Ejp4d4snGR5xARUaHRE271CFB1MspLI4EFYerSU5nSfssQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTo5nKka;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95028606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95028606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTo5nKka
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2037078f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 05:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794921150; x=1795525950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G4E5w3vIfYrEz/focXkw7N0ugWTu4zF6SufD8ZnoE6g=;
        b=jTo5nKkaXblBQgA/Rs8BiXfVG/18d/4UwaAwCQ1nCZblRseDAB04384QJ250tWeE9W
         miJacOwPxxIPHwBvpQdpXRxX9YX20FvKECdoSCMsNna9M+46Mn6wdPArTuab66k3FXBo
         4lLstdvfmYC2Rna8rcM+SlGl2y8S3x55vzKvyF6REoTe12OsaTulBQeZ2ui3CbEu93/N
         C5N1uuNqJ7r7UdwYTRAh8qRUJWXlhjEM+IX9gbcKaWc8l+CWiTvJXwVOQsgWkONO2Ty+
         DQfO2krZDFO5qS+OhL1npsmvdThMcKVYTq1sh2F6wnk2T6M7GYFO2bWXGFNLVV5PlTB6
         iinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921150; x=1795525950;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4E5w3vIfYrEz/focXkw7N0ugWTu4zF6SufD8ZnoE6g=;
        b=ixRBVPxWdx6R0HfYe5DSZTMFj3TYaF4MPJamhME9M2wD8cKy7mICcGiWYa5VExp5TF
         B4bRdg9MliMmqVA4+97hcBOmVfO+JA4yAStuTQbhW0BM/qb1p5RIAfXIlT6Kkq40fUBC
         rsDFkezhf7AJ1rzfcfvvYHRRaEpKNOfxoqCcaPTF/mEKoTp45pCP/yVYZvpoyfS0poCH
         TIttWS7yG9vHHctce6K97ruYSlMMJ1Zj/yQIqRZFRUg/tVXK0QoMrCRWGkGMi87EUnCp
         D8A5B3ZfeIsEyyBd7YBx/CUkfCvWLGn7q48rLtM50H9SGtVj54x3eGArUpagePM/ihxS
         3VkA==
X-Forwarded-Encrypted: i=1; AL+hErE9Q9f0OJxUjFja7CzBQKaMdjNm/dDUgs+HDShLQDZTom+8ycLbRKpMDGYxVggqVlA6adHGsBxluzqN8bE3w1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xo3jyu6g1TiCaKrQpRs+ONPHx+hJ5zNPuAlY+8romyn0GhSci
	YxQ7MPAp2SESJRy/de/47G992RqL0gKW3dsKs9GJ4lxBSHlxtdRvn5Ke
X-Gm-Gg: AZFdTZdOxWGaoYiC8MIOAuaclPdziDkQSm1fx9xtlumfXaLc3/kXYgHn7TErNhNKhod
	ZQEb9O991bzYD2MP62IL9SQmnLiMP0Y9dzW91ln0yBYMTfDD47ebZnEFZ2z2F7QpAKdVzrVzSEa
	joPzjUcqoEc0r8D2UdlF34IWNhnCu16qzi7jVdB1g3lYztdOB5LPWr7DmuwT9nU0UOGWdb1RuLy
	5dBsbTLf0ghXJLQGzCsYQkA+XQaStbCArbI9D1nmRB0PAqrMWuc+x0GQ+T3pBEmA1nO3M0SQcHV
	1YMc8FgIULyH5nBzW17urkOZ+3YjGeOmsaK2qOLqCcZhPCZV3I1h5rgkh7H0zNacX/vsnuGFfJK
	xAecPm/PH9A0sdy8DgMB/U5x8eVpSMvM/UeC4uxnlnxqBUvdZpAggvwOCDrAHgtR2ak+jaTHlk2
	BJQqvxzF1GW45LeY1kRuKgWRMSRzxQq8dSRte3bmnV6uOO2hWQtiwrBXBl/A89C6gPQdOIN2TKX
	ZXBmZ1UVVTJax++Bn8oVD39N3bj6BK+4ZDxWWanC8PbzXwLlIk9+bcSAAoqiMqou0gn/hB6cVnB
	3OCghS4xS2AWx0yz5gg0sFX4Kb8zBFX4w7cHrxr75cKNPAcIdYkvtjWi7eCY4od6oQ==
X-Received: by 2002:a05:6000:178e:b0:490:ae2:b841 with SMTP id ffacd0b85a97d-49c73a05d9amr29331087f8f.30.1794921149776;
        Tue, 17 Nov 2026 05:12:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c81a63b1csm26732407f8f.4.2026.11.17.05.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:12:29 -0800 (PST)
Date: Tue, 17 Nov 2026 13:12:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah
 Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Yeting Kuo
 <yeting.kuo@sifive.com>
Subject: Re: [PATCH 0/2] riscv: Add support for vector misaligned load/store
Message-ID: <20261117131227.3919c5bd@pumpkin>
In-Reply-To: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
References: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 23:38:36 -0800
Nylon Chen <nylon.chen@sifive.com> wrote:

> This series adds emulation support for misaligned RISC-V vector
> load/store instructions, which may currently fault/trap without being
> handled on hardware that does not provide misaligned vector memory
> access support.
> 
> Patch 1 implements the trap handler, with emulators for vector
> load/store covering unit-stride, strided, indexed (ordered and
> unordered), segment, whole-register, and fault-only-first forms, for
> both user and kernel mode traps.

I'd have thought that the cost of emulation would so high that you
really don't want to be doing it at all.
I guess you can't stop userspace (they'll just wonder why their optimised
vector functions perform so badly), but I cant see any reason for fixing
up faults in kernel space.

David

> 
> Patch 2 adds a kselftest exercising these code paths across the
> various vector instruction forms and element widths.
