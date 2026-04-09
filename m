Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9553D4109
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745656; cv=none; b=tMtgqWCOt5MifTMV7HGgsjCxc6+tunZUssWISiCsKKqo3WSo0/UbaQdbqnvtK3W2Fcz2bHkb+F+FoZiQX9lnDTUcpzFlj5h+VrKqwNLSv6bbtBKXz9QNHCZLJcV4foKxiX4SiTX/Ly7gFpMu3Ve40VqZ9mozu6u1WO7u6zzxo94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745656; c=relaxed/simple;
	bh=AouGHkgXdYe9anG9SbX/UJnI/L1Ht06pXTIqPlV3qiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACKnvNCMRBwXTYJlg3oZKCBY5dHyG9gFJiDmnP5LNxNEGhS6LddwatVQKkSvnKUNh39/2wCjml3i8DrWdxKZ9zD3nHSDkxIo1T1FJu+aguKL0aqaIgeJ1btZVSqGzzqsO3tZPgcKEBc0bSOXnd/5COEn6O/1sKb7Z41iyXXvj1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4kudXV8; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4kudXV8"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so388277a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775745655; x=1776350455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AouGHkgXdYe9anG9SbX/UJnI/L1Ht06pXTIqPlV3qiU=;
        b=G4kudXV85Zy5Beb768hB6ozQ9L9xN7RQM5iGTnxKNylcS/2d32ZEKi9vSZKsAhfvAE
         HOKRgBaunI70XmF6EVyKUAgqJPR0Bx5HBAdFFHcvFnPzwIm36VjwFJDJLxVmNWRwqkyV
         9MLpAqm/rouEtIPcctQ7Vzu0M0cSQMPG6qXcvtO/pu5OoUUryYLSBSm3IDxvNsZtsJFu
         UYwC6rVi7xxLXm/t5v4ZP4EpWjKnVMCbNLyl93gXqc40x4P92GEls/iP+6FSM6dqJGJY
         3C6KIjAqU5lhdUZATD3d9/aAVCJI3YREQGLUmOFZC26FjK1x+zY/01glnrmUoIQPs9Yh
         EvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775745655; x=1776350455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AouGHkgXdYe9anG9SbX/UJnI/L1Ht06pXTIqPlV3qiU=;
        b=VQLaj+ZzojuGcdChD8ZJQZEwo9wBa1MO/FFE/BIiFy8bJjwGyf6/lURSPRpXDeRSUO
         B8x7USKmUuILIB45BQUTB2sjAyy/zF7Ss3Nzf2dFyCfUVHkxlvImz6O6c+XzmiZAe87v
         HE6iOAQvlrrMIL2dJIdraFzKonodipRW5sGowvwkPl+/Bd8q1MY/mCvlot6VZ9rvxiwZ
         5ZWPjFSLxXvYySL6vtty42K8de2pY1pSnz7b6LGaknu5ZQCsx1AoDq1te8H37Phpu/eP
         Hr+NyNwtcoRnWPuze1weFxUFG6N38ZSjFd7jYGCjva90Iv38+2XA1ryeFeUOtGcBlgLe
         jnIg==
X-Gm-Message-State: AOJu0YwFynFFQw5GjozIdxI4oHITmE3uGkVdo/lTIU/uzhwxEienkgvH
	S9it0V85b1AmkY60ovSSgjDuzf2rhdNUcHLWD16tzBtBLTKNNIvuyhsEBUHtLuRNr1U=
X-Gm-Gg: AeBDievRDx1YLh3N4jDgpUmInG/et0mYTYQN7bAJOjG0g2Z4YOfCSPZ2bdcNDwnWI4E
	WZdBaccdj9Y3+tlGGWw+RneCShPAc1rJZ4Mi9NiM6HUcEJLcRfFyb0PW9wpsdOor9GpRO3/Qzbb
	fvsyeQtAwgRKrVekh/vEpEjOoj48lzrUMGN1VSLUPJePExcizhyVcfxdKR5kM5srJSTCZDLniPp
	ZqhfY+1j9WuBDg7cjwR55/wVJ9EVf3iG3PFf77FjCU1nQEsddFW+MIclQQPcHKmgBjYeB9oo7n3
	pUsOFF3HMzUcmFrBgX9SqxeJQ/VuX3YxEQQhuBLcY6V7H15C2R0BPFPvrAddtdv/oM0MfKh0QUm
	Tt+MHaDEqbUzucU7s0prUH9Tqc4OomgcKt+gWoNuULld9+ZrxrmIf8t+y5Q3rTFHekV2N5rvIDq
	JKxvMZJe4898tFDZcrRl5q
X-Received: by 2002:a17:903:1c2:b0:2ae:aa16:acf7 with SMTP id d9443c01a7336-2b2817bcbabmr255292475ad.40.1775745654694;
        Thu, 09 Apr 2026 07:40:54 -0700 (PDT)
Received: from laptop ([223.131.147.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274779b48sm335511965ad.25.2026.04.09.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:40:54 -0700 (PDT)
From: Woojin Ji <random6.xyz@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH] selftests/bpf: fix const qualifier in fexit_bpf2bpf test
Date: Thu,  9 Apr 2026 23:40:50 +0900
Message-ID: <20260409144050.374405-1-random6.xyz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7967c952-3922-4b49-953b-530b80850aa8@linux.dev>
References: <7967c952-3922-4b49-953b-530b80850aa8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the pointer.

I missed that commit ca0f39a369c5 was already applied to bpf-next.
Sorry for sending a duplicate patch.
