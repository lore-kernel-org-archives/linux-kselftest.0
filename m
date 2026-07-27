Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555C2F4A14
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115986; cv=none; b=rFLfdoEhLVEckmX8XgxUq3we3cp0Wm/t+KM63nz++LXZoPKLh2qORzPSoeklePKfRRyB4TcJYe0T16PjXXfr1mLoI0m3O+QK1OhHpNi66rkDnAxIbLj2e/V5zbiyJiE0DGxmlSdLYM0W+BMAYXjQkknXzXLhBJ9oAsQVtyn/nfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115986; c=relaxed/simple;
	bh=JvhlWiHubvipXGwiyYDoGh8n5w2sId5TPv7IkZCZSf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sv7959QXdWZHXFwDqB2APZqnDJUV/loxG2gkaHABDc3hJT5Z22peFCoCZy5/uWJ6d6ub5Jk2/9ZLb5GjPvBWucBPgvB5Ev1r5z7VykyWyIsdzo+nY7kTELKENrXuCTPscJ95Q5JYY65/EUZpeHAk5Um/33MEb7NS4vVbhgbNXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=OPInpC6S; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="OPInpC6S"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1261195a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 18:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785115984; x=1785720784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QS8YqykbG3lvtABz9lYv5yB3o6Nx9CfZmlJ/xUd/ZDo=;
        b=OPInpC6SF8U06+gD1VYAE4r/QyeGlQnM65JGdQQycmup3iyYfolkUD7K91ZelX9FmZ
         BxJojypUVdVl7embGSj6MtxpG9vUa+jeqdsAL8OVlfr2thOkT2Pqz8JN4EGRLERJBUNU
         o5GRhwTaGNgS1LLgMzgIlhmebIA8LqiBGNuPpaGJyy+gkfalDY+i+w8jH3ehu7RSvKYN
         nMLzqi78rruBOUhezUXvJ9WF1UebAst1v6FdYjAr7Zh1g3eBxQ6BhPiaerFXQaVId3zc
         1CSZmCVN3kIn8yx+Ui8Os8b0ecRoIWtRgPteHp7DYzGc4lmdycodpZQahfBrkZB5hnbi
         gnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785115984; x=1785720784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QS8YqykbG3lvtABz9lYv5yB3o6Nx9CfZmlJ/xUd/ZDo=;
        b=lXFQcv9XXXjOZ76SL1UDB1HHdYmLdyaYLeSX3Qj1sUmvCs9q6qmX7djIQhvcjz3IqM
         fJXfBazNQpjoBOucl5xLks+9H/MDna2iIW8KgVq/OXtolTRfr6R5rzF+JwHWQjyGNlOl
         umPAFX9tWCBgjzK5CGfTyMN+FIK6ySHAjahqDCjUn9B/9D4ggq00+fTCXhet58F8iwh/
         L3oSv6z/LGmNQ4IJssfNXI5thcCmVxrdgve92gEGCMbLw9pxZW+dMZs+Zt9XK1R1/0cg
         EBkgdUwqakUfM9IIuVhrh5RQmuDN/dpPEHA4qDMtnhYmMuQ4zWivjHK4Ib1r8Tm0vjn3
         EI5g==
X-Forwarded-Encrypted: i=1; AHgh+RqkOE/+6rX6kBwG8HaRwCPnXul8ItE0XbQK10UBnAv0u5ZMzWs/MdNbV2jDKrXCyYnkgKVxioYr7sjNPnsQK9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YziohGffQTyNgb2sN8fPnNE50e23XW+XVCeWKLDQ23dTxQxDLPP
	4Qwhnsu6vuzMSHdBk4wKX5l/U7gxh36/A6UV7DLBbocsZpOqHch2EUBCG9QFdCHRAUQ=
X-Gm-Gg: AR+sD10c7HYTVGy2Io37W7bCn3GCBu/k3eHOPdLTZBfgcLwCe3eNj9b4OrxFbfGHkdC
	r0P6S/LM0FUeI7aI1WItUBvYntIQfD/q5LG3LwTOjRm0X6xhsGwx1n5XguEn0ui/+mLpDWsvqrK
	52EVSi48aILDeytOGlBv5EXHTeXUPGWc0DI7PYF1cRrpZ+ygeeUOK2Ph4GbtjN8H7L/Duyui1+6
	TQ+f0fZpO/MoLRAvvJCrUb7it5w0myKSOygDmzgUKazzChb9ukIjXQPukhdisT1gUp2GVL5vs3B
	oITeuiTlIkuGsxALpLXgPc1CvvehhzwCkG8lKjEEVH1RmCuTMl8OWqcrGf3g0A6c6Jf3GUtdcL1
	tgkfZin17aVrNP2j6q99acxPgxBT9ILHZbnzO0tYKj+Er26r3ffGhbt7HM3XCmO7RZaZaSzpkj9
	BCcHgfKmF8JlcyXTvUQe6fpjuBCeHl0EEiiWyWKaFdX81VBozgdC7ed6auW5pd55RjodG7Jag=
X-Received: by 2002:a05:6a21:695:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3c67dd65ec9mr6364557637.22.1785115984125;
        Sun, 26 Jul 2026 18:33:04 -0700 (PDT)
Received: from ?IPV6:2402:8780:1329:2779:943f:461f:3cbe:df62? ([2402:8780:1329:2779:943f:461f:3cbe:df62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e53094d65sm18958049c88.13.2026.07.26.18.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 18:33:03 -0700 (PDT)
Message-ID: <6a5f7481-124f-48ad-ab44-577b12d33592@openresty.com>
Date: Mon, 27 Jul 2026 08:32:58 +0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] selftests/nolibc: add abs() range test
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
 LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang
 <yichun@openresty.com>,
 Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 gwml@gnuweeb.org
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-4-ammarfaizi2@openresty.com>
 <8bdacaf3-7f93-4095-8875-4c13a273fe3d@t-8ch.de>
Content-Language: en-US
From: Ammar Faizi <ammarfaizi2@openresty.com>
In-Reply-To: <8bdacaf3-7f93-4095-8875-4c13a273fe3d@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/27/26 3:00 AM, Thomas Weißschuh wrote:
>> +/* abs(), labs() and llabs() over the whole range of their argument type */
>> +int test_abs_range(void)
>> +{
>> +	int i, ri;
>> +	long l, rl;
>> +	long long ll, rll;
> 
> Reverse xmas?

Fixed for the next revision.

>> +
>> +	/*
>> +	 * Both the inputs and the results have to stay opaque: the compiler
>> +	 * knows abs() and friends never return a negative value and would
>> +	 * otherwise fold the comparisons below at build time, which would also
>> +	 * hide the undefined behavior that is being tested for.
>> +	 */
>> +	i = INT_MIN; l = LONG_MIN; ll = LLONG_MIN;
>> +	__asm__ ("" : "+r" (i), "+r" (l), "+r" (ll));
> 
> We have _NOLIBC_OPTIMIZER_HIDE_VAR() for this.

Oh, I missed it.

> Maybe it can be made variadic.
Sounds good to me.

Does the following patch look good?

From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Sun, 26 Jul 2026 13:17:14 -0700
Subject: [PATCH] tools/nolibc: make _NOLIBC_OPTIMIZER_HIDE_VAR() variadic
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The macro only takes a single variable, so code that needs to hide
several at once has to either repeat it or open-code an asm statement
with a list of operands. Accept up to four variables and build the
operand list from them.

Existing single-argument users are unaffected; the code generated for
the callers in stdio.h is unchanged on i386 and x86-64.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
  tools/include/nolibc/compiler.h | 15 +++++++++++++--
  1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/compiler.h b/tools/include/nolibc/compiler.h
index f2d7a81d0d7c..ed69f6d26f56 100644
--- a/tools/include/nolibc/compiler.h
+++ b/tools/include/nolibc/compiler.h
@@ -77,8 +77,19 @@
  #  define __nolibc_static_assert(_t)
  #endif
  
-/* Make the optimizer believe the variable can be manipulated arbitrarily. */
-#define _NOLIBC_OPTIMIZER_HIDE_VAR(var)	__asm__ ("" : "+r" (var))
+#define __nolibc_hide1(_1)		"+r" (_1)
+#define __nolibc_hide2(_1, ...)		"+r" (_1), __nolibc_hide1(__VA_ARGS__)
+#define __nolibc_hide3(_1, ...)		"+r" (_1), __nolibc_hide2(__VA_ARGS__)
+#define __nolibc_hide4(_1, ...)		"+r" (_1), __nolibc_hide3(__VA_ARGS__)
+#define ___nolibc_hide_narg(_1, _2, _3, _4, N, ...) N
+#define __nolibc_hide_narg(...)		___nolibc_hide_narg(__VA_ARGS__, 4, 3, 2, 1)
+#define __nolibc_hide(N, ...)		__nolibc_hide##N(__VA_ARGS__)
+#define __nolibc_hide_n(N, ...)		__nolibc_hide(N, __VA_ARGS__)
+
+/* Make the optimizer believe the variables can be manipulated arbitrarily. */
+#define _NOLIBC_OPTIMIZER_HIDE_VAR(...)					\
+	__asm__ ("" : __nolibc_hide_n(__nolibc_hide_narg(__VA_ARGS__),	\
+				      __VA_ARGS__))
  
  #if __nolibc_has_feature(undefined_behavior_sanitizer)
  #  if defined(__clang__)

-- 
Ammar Faizi

