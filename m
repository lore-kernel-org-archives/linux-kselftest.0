Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2030463B8E
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 08:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089701; cv=none; b=NmcHYnIGj2N70HbM3cAtFsMi3PNrwEnyVlCZevlnQNfLHL3xIxEXx5v6LnVBK8eztE3EqchIT7/K+1N00DEjvKA94fg5ppOCmHa3N9pxEPRcVpEEAeYMK1VXGG8rihWbFsv42rkceA6HgAWa7Ez3sMaAgsL3CwjJb/g7GUZz8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089701; c=relaxed/simple;
	bh=FpWnexbTRPZZjWnkVgOVliYNIT8UTJAknZ1Ml5PJrm8=;
	h=From:References:Content-Type:To:Subject:Date:In-Reply-To:Cc:
	 Message-Id:Mime-Version; b=in7bFijBzLZrhY2QWleiSF5ONX03TBUMLwci64WFL3395/cIJcV+Ghy/XswaHFgxmuul6RWxVquPZ2L0JbE2eX2xXMwy4Gu8QfNG7D8pwLdH8pioGvRWVFUEdK6aHx7GvvDvzbnxo2ZeS19uQ+JvqdGYjN+QsZ7nC1NkzZ+fqEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EPvHblHY; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EPvHblHY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1786089684; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=nLOA9Bye6eC2C0r/n8G6G6RgBNHXoYHLuuMhRrEPYzM=;
 b=EPvHblHYegMfPrIl76ov26yiVB0saQtYA9g1JR7gzDSaKKolWl/mkggC08xuSrBD0bXkKz
 0zW80kScl/vcaCNvLlcxmC+jO9JjUbUTp1KaggscC3kRe4YahMT3SwD0jdoKcf7Z8cxYO2
 t09cmt9q7Vp46DWhb1X8kC2+pnVkqXZZFepu+JsX598MVlml6ljwyBKrwxxHPzQpOAt9Dx
 Wb92qGKgLI6xHe39jN2QJ9WWisv5pEXAzojDMp0zfKpajCJhJAjhOrOERFJ8kAt5NtzqtY
 3l5OGe+mT6SFKlTeoOyYSZC0ZdeDEoMSJJzPqwKEbevUkgnxmhrzYUYCuV0f4g==
User-Agent: Mozilla Thunderbird
From: "Rui Qi" <qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
References: <20260806083101.2651025-1-qirui.001@bytedance.com> <20260807104709.0626fd20ed7618273dcbead2@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [PATCH 1/2] selftests/ftrace: Force C locale for readelf in uprobe test
Date: Fri, 7 Aug 2026 16:01:05 +0800
In-Reply-To: <20260807104709.0626fd20ed7618273dcbead2@kernel.org>
Cc: "Steven Rostedt" <rostedt@goodmis.org>, 
	"Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, 
	"Shuah Khan" <shuah@kernel.org>, "Heiko Carstens" <hca@linux.ibm.com>, 
	<linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Message-Id: <a1f16b86-89ca-4286-841b-da9a081c8d33@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a7590d1+dfa1de+vger.kernel.org+qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit

On 8/7/26 9:47 AM, Masami Hiramatsu (Google) wrote:
> On Thu,  6 Aug 2026 16:31:00 +0800
> "Rui Qi" <qirui.001@bytedance.com> wrote:
> 
>> The add_remove_uprobe test parses the entry point from readelf -h output
>> by looking for the English "Entry" field. readelf output is localized
>> via gettext, while the ftracetest runner does not force LC_ALL=C and the
>> top-level Makefile leaves LANG effective for child processes.
> 
> Hmm, to make it safer, I think we should force LC_ALL=C in the top level
> of ftracetest, instead of setting it in each test case.
> 
> Thank you,
> 

Thank you for the suggestion.

Agreed, setting LC_ALL=C in the ftracetest runner is better than fixing
this one readelf invocation. I will update ftracetest to export LC_ALL=C
so all test cases inherit the C locale, and send a v2.

Thanks,
Rui


>>
>> If readelf prints a translated field name, ENTRYPOINT becomes empty and
>> the uprobe_events write is rejected because the offset after PATH: is
>> missing.
>>
>> Run readelf with LC_ALL=C so the parsed header field remains stable
>> across locales.
>>
>> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
>> ---
>>  .../selftests/ftrace/test.d/dynevent/add_remove_uprobe.tc       | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_uprobe.tc b/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_uprobe.tc
>> index f2048c244526..f33a863be68b 100644
>> --- a/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_uprobe.tc
>> +++ b/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_uprobe.tc
>> @@ -12,7 +12,7 @@ echo 0 > events/enable
>>  echo > dynamic_events
>>  
>>  REALBIN=`readlink -f /bin/sh`
>> -ENTRYPOINT=`readelf -h ${REALBIN} | grep Entry | sed -e 's/[^0]*//'`
>> +ENTRYPOINT=`LC_ALL=C readelf -h ${REALBIN} | grep Entry | sed -e 's/[^0]*//'`
>>  
>>  echo "p:myevent ${REALBIN}:${ENTRYPOINT}" >> uprobe_events
>>  
>> -- 
>> 2.20.1
> 
