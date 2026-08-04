Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8812DCC05;
	Tue,  4 Aug 2026 05:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821566; cv=none; b=UKfQu6zCz+cGCuxQCy011hzytcL+g2Vdp3tsMo+M0KfRQxyaGJ0o5Sre4YFLWV4PnPVGFBsqUPQ3BofznXOEx9hWAJRUVxmJjQTED/LK15x03oSUZ85ISpN7F2quQpRwR4LcAD1DtMZwWeQYT899LNwAGQRD0zNJHpgkaSDhXEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821566; c=relaxed/simple;
	bh=i7Blg6HS7FjCMvXc+I6pfZDVvxiekmlDjHKdB+lk7l8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FfBa/yNyTll5AfEKop/jKd7vgvFN9m3mFTtaeer1F/L4JtwfnOU3bk0oiIg3DVuIboYU4r5rVnALqmg6lJU4UoZYJ/+2Y3COpGuNaMxYjwhTUZRlkT0dFCUdrDjAR3Nso+W/1XVOZQJ3dNQjjvx2fjoq7ziue7WTm/4Gc5/Tths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UwaMfwWt; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UwaMfwWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785821555;
	bh=i7Blg6HS7FjCMvXc+I6pfZDVvxiekmlDjHKdB+lk7l8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UwaMfwWt/TrXemBHHokzGDrgi35+VENz71Wozd88y3hCNe5h7DCf/DOUVdUje4R7A
	 XrhzNY9opr6KTaIGY16RiNjTmQtS6MAMYpGlQFkn4w6m81zq2nWywFfKaDEukDRwQL
	 ISrjdHctkd9fmFGIKuz5mnFb5W+Z+73fclAfknwk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 04 Aug 2026 07:32:33 +0200
Subject: [PATCH 1/4] microblaze: uaccess: Zero out destination on failed
 get_user()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-kunit-microblaze-v1-1-6dcdfe12eb40@weissschuh.net>
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
In-Reply-To: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785821555; l=1036;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=i7Blg6HS7FjCMvXc+I6pfZDVvxiekmlDjHKdB+lk7l8=;
 b=liGdz3+aLJ6SI6qQ8ylOeYSMqLoQEGA5APLNqqYIV+SV2lOn7JJal0+uJEZ3mqLQ+xARMYQfu
 lZI2iff/b3PAS09ATKLx3bQdHMDuGK8d6Tyw5gyFHw3QvxBpryc4cqO
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

On failure get_user() is supposed to zero out the destination variable.
This is documented in the kdoc of the microblaze get_user()
implementation and validated in lib/tests/usercopy_kunit.c.

Currently that zeroing is missing.

Add it.

Fixes: 0d6de9532663 ("microblaze_mmu_v2: uaccess MMU update")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/microblaze/include/asm/uaccess.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/include/asm/uaccess.h b/arch/microblaze/include/asm/uaccess.h
index afa0dd8d013f..77203af255e5 100644
--- a/arch/microblaze/include/asm/uaccess.h
+++ b/arch/microblaze/include/asm/uaccess.h
@@ -95,7 +95,8 @@ extern long __user_bad(void);
 #define get_user(x, ptr) ({				\
 	const typeof(*(ptr)) __user *__gu_ptr = (ptr);	\
 	access_ok(__gu_ptr, sizeof(*__gu_ptr)) ?	\
-		__get_user(x, __gu_ptr) : -EFAULT;	\
+		__get_user(x, __gu_ptr) :		\
+		((x) = 0, -EFAULT);			\
 })
 
 #define __get_user(x, ptr)						\

-- 
2.55.0

