Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB48D30FC12
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779535815; cv=none; b=A0Y/+LAOIZPgDOGloI6vfpI5lq/4xT4E9HQx7NGogPaW1qypipaRzWZaAmBzngsu8HNfFA7JXSX+MO2h0im6BrgyUi2A6g/vrwAFSHu87TWJ0jjU6C/NRW3XT/OreJWyjzx4/tDBY/RMytO95q6e08SMAjD1gmKzh/pPFvzX2kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779535815; c=relaxed/simple;
	bh=JMI44/ouLWGh9v3cwRXboxes8Ebe6Yq5Nc7HqOw+anI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nodyTGVATVUKn3tzvmaFJ357S3CiomAv1AGT+Q1L3Mu/VajQOkYSH5oAEG/Hxx4Lh7iTHF7B769ij513qVEuWAnSmuLV2fKTc44PM07JevJoqWBczPMod02IcFqY9CYB4+3vmcowoj6T7fcHi1GK07oYWxMqF3PgLD5FBRPfmHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ybw8ACPE; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ybw8ACPE"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bd0209f25c1so1316693666b.2
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 04:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779535812; x=1780140612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JMI44/ouLWGh9v3cwRXboxes8Ebe6Yq5Nc7HqOw+anI=;
        b=Ybw8ACPE4O+XhvcRXrDJyvODHQ0XC519EcisfoVwi7aDBZF0f8QBK5o9wtLHcI7+er
         fTW6cdrnPbS0+Rs8nev15Ge1qloUIB1wEzdoYnhh13A6beuqddmCSsejfBSnaQFuy9F9
         e1ZGeSGsh76mZnqgaEtNT27qtWZdAUU2p5Ev87dxbx6qdbD4r6EK2T/Klb4KEalU9FRr
         N7gEzk5jIr/H11MejWFBs0rTV/+gEJ0m7ldQmQuwRKJ4Olmix+JETv8cm97f644ylB35
         hwkvN6YRX0gdDL1xhVDeXbNoED6SvSSvO6XB2xTeacgnzYJzNAzppsIq7vcc9fNUssgo
         /NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779535812; x=1780140612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMI44/ouLWGh9v3cwRXboxes8Ebe6Yq5Nc7HqOw+anI=;
        b=VMZh/jHZPKae+E/Uz0F2Qvz+Yr2bNAh40awEKIS83K4TPKJj+cbt+G0H0x629Vkrav
         FtoSwC0nxyMsK1FJWGfezq5f4mLSdmjBAd7llEj2RqaZlS0yOGBkzq2LGe143bt/8JsA
         Z6zsYw3Iqeggf1Ti1ioX7phssQeox9AZ+TvVpzAhUQDTn5+8bB8uh5iRW0uADBD8vCqC
         upnLFSHQuxvJpYVQmem6IWMmUWbDu4YRcmBhD+zwNlsuiPmw1V6WWRu6H/Chab2oPKz2
         ZVDQmXVzy8/9+c4dIp72swfFzUOlWHqIykIOYvj139Y5OSyvQJiQoqXSE9tCBnN7iSiY
         q7PA==
X-Forwarded-Encrypted: i=1; AFNElJ9cV1/hfSdK8lfcF6EmfhxGVD2xsSMTQdYhMb9Rqou4AETeF+AO9KA8Tk1eld2JPYtxmJJpdXsySJp+3Cv6MZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd8F49MMHXSSdLEJti1MnfTivSicVRzGncdRFNBk6+v8AsfpLx
	4M3SA7Lw3qckD5jjhTxq+c5AEHmx4V82FE5K2aHB95jNFaJltDIc4GC2nluLjvvNrD4=
X-Gm-Gg: Acq92OFMN+9QNikdkA/i52C671CkVtUbdERrtgSyaOMxOFkpHCaZFTsk3jkHbVVYGFA
	QeekQKrX1tOFDOLRRLvG5wyE7yjR37Hit43szXfC/zJN0Z5tyKM6/W9gvvcPRIcg+/isXeTwQJ2
	+G6tWL2wb56n7gvOlZ/K+PSMRqq2EuAjAmaQiRYzZpK0wl5deeOnbyO5X6IzGRYHt3LeiPhdMDy
	XqkzBPn69MGL1Ztwo+hLMu+gAC9pefpkITJvtDXo6+MS6813MFHOqxHjbdHHveJ6GUzRaaGiwML
	NgGD1qbQVTiChX6AtY+gVAAH1Iz7Hs3wHdHTHPBGmhABSyONiI6+dsjQrZeHWUTzRO3UlQFWP7F
	5TZRhS4YT6CXnI6YCgEQrUlN3Xv8KjGuFj3zer8HG5FxGSw1LeTwCJrYancwEZSqN3LXSy3HmXd
	noJCDGSPoImkUxCNJqZ773+1aVGxJo8eq/FcsBpAv58kxggSiudq3U/T8Zh8RXHkVMNZyuLLQCG
	2Ws0pKeovbw
X-Received: by 2002:a17:907:b5a6:b0:bdd:87c:5bd0 with SMTP id a640c23a62f3a-bdd28a79cd4mr339609266b.11.1779535811817;
        Sat, 23 May 2026 04:30:11 -0700 (PDT)
Received: from localhost (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dea6sm171918966b.7.2026.05.23.04.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 04:30:11 -0700 (PDT)
Date: Sat, 23 May 2026 13:30:19 +0200
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: seanjc@google.com, pbonzini@redhat.com
Cc: vkuznets@redhat.com, shuah@kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: hyperv_features: test write of 1 to
 HV_X64_MSR_RESET
Message-ID: <ahGPQDJCT1aW7vVY@arch-piotr>
References: <20260523111857.195396-1-piotr.zarycki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523111857.195396-1-piotr.zarycki@gmail.com>

Hi,

After receiving KVM_SYSTEM_EVENT_RESET the test simply advances to the
next stage without resetting the vCPU. Is verifying
KVM_SYSTEM_EVENT_RESET is delivered sufficient?

Thanks,
Piotr
