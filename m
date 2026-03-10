Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A862E1F9F70
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 02:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111531; cv=none; b=nMd9iVn73luyOJ5yXh/1YiifccroB6RBmzYHe77ztH+X2CvC0PB9XKOhosv+QeCgGsO2O+ZNxWr3pWLNFXVQzSEtZbuSsJd2llxp3TFYIsPndkeGrpEM4AAsE8JLcdkAvJ32OSoJO7Diozk8Q8fOxJJ3hivD1ZsrPm4VsHgQYuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111531; c=relaxed/simple;
	bh=s6e+nCxpSEyp605vwBp3KvbGhqVigOHLWjaDoMTNfFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOWHWzlrIxCVuJY9VHQiSCRCK+eM3xtuoy6sJezT9Khxzomosm0boNVJukWpwe9ZgnNWmEFen1seAvfVMiKUiql4fCz1U4VqTk2S0WSCJBeKSpgOzBWAoYLEyt3Qzi1QjYU5v3OEBMryn1vUqMRiEHgyZjIKEupq4W/JJA5orP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=JGQnD7vb; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="JGQnD7vb"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2be1d9c356cso7084184eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 19:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1773111530; x=1773716330; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2mcX55qyR+PnOq0AxxdFtVjRyud0Rj+p4rJPW0KkjK4=;
        b=JGQnD7vbV94oAnj5FlMqNhqvZhxfcTVi03v5Yv7qAlc3wgGsnxdzvnNuMSZfUe4evq
         W6zasVOCHRc96q+r1SoX/bNJBBCK+JBbqAe1G424BPDL7KUyJL1HowJ6AVvCacXiXsYp
         nMJHJKDaBlqk4cRcVIUC637HpR1VIsUfa54KR+sQVr7mITXR9YOiXJhjtbGSFDDFxTPL
         7jK24v8hw4x2TVARtKPtaKARv9tcOpPRQBIuykQMZD1iOJF+E31ymVGUp3yzqQ5E8Af/
         B+aLOMX/bcSFSl77RjzrSg5e582E74CEbHRjJOCmLFsVbNzAIiz5hZ4GPd7bkn6ouSHG
         DEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111530; x=1773716330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mcX55qyR+PnOq0AxxdFtVjRyud0Rj+p4rJPW0KkjK4=;
        b=wzX09zyENCP4ByaRiCZghHB8yd0ya0D3shN8Z+LJi6c2+top4xG0gqQ5MsBkOsqmoi
         xy/22to9qMgE9ztMRHi7mBakivV3ydZMwA5UecTnARmDxzKIOOOsp8Xkb/pTG1Jo5H2S
         c1vACis8cWlTmdpTzdS+EEZqBAJgq3YlG7MXA9dEawDoOhWuGTBUiO9jJkWhh80C7sVe
         2USPiz/S3gOd15cicZg7oenOTuFpgO1PZ5SkKshL6OtoZu6JbMJjDIDH9FxVk3QVSm3J
         uo7vH9qO9rwOdLeSmPAOatjdrAcHEFigMwswjprWB4Fj3u2Jg0Yc6mK6XSrlhRs2wTnB
         5CxA==
X-Forwarded-Encrypted: i=1; AJvYcCWT2EOXiRw+G7mjfoGtNyBfTEG0HwSXKYVoV8yTOMe6owQ0O/UhWAz8cmFBG34eaC+yEqsYt8V5a0QrGEdCcZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuvoYkKKHq/L3/Mgo4YWgWwhPIF5hH9jKxEyAajSG1lr+MB0rp
	0FX3yhegWhmcpEznLw/gCQLnv8ROYtPYVrkA4RFvEb23x5sdyYdM78OxZiZWVoqxwOs=
X-Gm-Gg: ATEYQzxYJr6Jl9tslXlbqTlzaeng02Az9T1+4/gj3/Wxg7c3zmZdgTIU6MCveUlbedb
	ZbdUkbzZ36QCDFVvr8LDxqYy6F02xtbhEGMIxtkDFfwiwzdAHe1JJLvkYkNGi7dPMP0NYP9hTbL
	g9JgUsXGz7YQ/tk802Xvew829G0354A+P54KSYWu5bI6TtvzjXpU1PxL3PvJ0ccYtpFs6WQKAvr
	fKGq/fXxDBwfqJ+bpeq0BMQjmmW1OEGf5kf1+kU1z6k+A0pMJoa7fwcL/2acfa+RknWlCKQyOcv
	IIfRYQ3+hIAtP5klR9l11DZKQ6C84cZEJy/VrUQuRrwt0AenBn8GBIVhKrm7FXdR5tzDj2orR/t
	LcBetmtOMO95Wx603j0spZ5LX2bB736PDBw9Cr5FBLQoBpXGn56pSe1mK1s8LaMngjA4oPxEjmW
	cnZtw5I+3lBR9nfZal99oyCPY/taLM07pO
X-Received: by 2002:a05:693c:2c96:b0:2bd:c883:5f8c with SMTP id 5a478bee46e88-2be4e08b1e2mr5642589eec.36.1773111529870;
        Mon, 09 Mar 2026 19:58:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f9836b6sm11352483eec.31.2026.03.09.19.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 19:58:49 -0700 (PDT)
Date: Mon, 9 Mar 2026 19:58:47 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Andy Chiu <andybnac@gmail.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] riscv: ptrace: Fix BIT() compilation issues
Message-ID: <aa-I56-dJKtdmr6V@debug.ba.rivosinc.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
 <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>

On Mon, Mar 09, 2026 at 06:52:12PM -0700, Charlie Jenkins via B4 Relay wrote:
>From: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
>BIT() is being used in ptrace.h without a definition, resulting in
>compilation errors in tools/testing/selftests/riscv/cfi/cfitests.c:
>
>cfitests.c:101:60: error: implicit declaration of function ‘BIT’ [-Wimplicit-function-declaration]
>  101 |                      if ((cfi_reg.cfi_status.cfi_state & CFI_ENABLE_MASK) != CFI_ENABLE_MASK)
>
>Include linux/bits.h to resolve this issue.
>
>Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
>Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Reviewed-by: Deepak Gupta <debug@rivosinc.com>


>---
> arch/riscv/include/uapi/asm/ptrace.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
>index 18988a5f1a63..5b53cea14355 100644
>--- a/arch/riscv/include/uapi/asm/ptrace.h
>+++ b/arch/riscv/include/uapi/asm/ptrace.h
>@@ -8,6 +8,7 @@
>
> #ifndef __ASSEMBLER__
>
>+#include <linux/bits.h>
> #include <linux/types.h>
>
> #define PTRACE_GETFDPIC		33
>
>-- 
>2.52.0
>
>
