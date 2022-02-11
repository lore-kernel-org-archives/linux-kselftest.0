Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3272C433F5
	for <linux-kselftest@archiver.kernel.org>; Fri, 11 Feb 2022 20:32:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353217AbiBKUdA convert rfc822-to-8bit (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 11 Feb 2022 15:33:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351880AbiBKUc7 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 11 Feb 2022 15:32:59 -0500
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2529CCE4;
        Fri, 11 Feb 2022 12:32:58 -0800 (PST)
Received: from in02.mta.xmission.com ([166.70.13.52]:58500)
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1nIcb8-006sHy-VQ; Fri, 11 Feb 2022 13:32:55 -0700
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:52036 helo=email.froward.int.ebiederm.org.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1nIcb7-00A7Qi-RT; Fri, 11 Feb 2022 13:32:54 -0700
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     Solar Designer <solar@openwall.com>
Cc:     Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
        Alexey Gladkov <legion@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <shuah@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Ran Xiaokai <ran.xiaokai@zte.com.cn>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Linux Containers <containers@lists.linux-foundation.org>
References: <20220207121800.5079-1-mkoutny@suse.com>
        <20220207121800.5079-2-mkoutny@suse.com>
        <20220210011405.GA17076@openwall.com>
Date:   Fri, 11 Feb 2022 14:32:47 -0600
In-Reply-To: <20220210011405.GA17076@openwall.com> (Solar Designer's message
        of "Thu, 10 Feb 2022 02:14:05 +0100")
Message-ID: <87h795xhxs.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-XM-SPF: eid=1nIcb7-00A7Qi-RT;;;mid=<87h795xhxs.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.174.4;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1+5Gcs6GFJ0JaUFgYHgyqu37QsE/9if+6I=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [RFC PATCH 1/6] set_user: Perform RLIMIT_NPROC capability check
 against new user credentials
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Solar Designer <solar@openwall.com> writes:

> Hi Michal,
>
> On Mon, Feb 07, 2022 at 01:17:55PM +0100, Michal Koutný wrote:
>> The check is currently against the current->cred but since those are
>> going to change and we want to check RLIMIT_NPROC condition after the
>> switch, supply the capability check with the new cred.
>> But since we're checking new_user being INIT_USER any new cred's
>> capability-based allowance may be redundant when the check fails and the
>> alternative solution would be revert of the commit 2863643fb8b9
>> ("set_user: add capability check when rlimit(RLIMIT_NPROC) exceeds")
>> 
>> Fixes: 2863643fb8b9 ("set_user: add capability check when rlimit(RLIMIT_NPROC) exceeds")
>> 
>> Cc: Solar Designer <solar@openwall.com>
>> Cc: Christian Brauner <christian.brauner@ubuntu.com>
>> Signed-off-by: Michal Koutný <mkoutny@suse.com>
>> ---
>>  kernel/sys.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/kernel/sys.c b/kernel/sys.c
>> index 8ea20912103a..48c90dcceff3 100644
>> --- a/kernel/sys.c
>> +++ b/kernel/sys.c
>> @@ -481,7 +481,8 @@ static int set_user(struct cred *new)
>>  	 */
>>  	if (ucounts_limit_cmp(new->ucounts, UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC)) >= 0 &&
>>  			new_user != INIT_USER &&
>> -			!capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
>> +			!security_capable(new, &init_user_ns, CAP_SYS_RESOURCE, CAP_OPT_NONE) &&
>> +			!security_capable(new, &init_user_ns, CAP_SYS_ADMIN, CAP_OPT_NONE))
>>  		current->flags |= PF_NPROC_EXCEEDED;
>>  	else
>>  		current->flags &= ~PF_NPROC_EXCEEDED;
>
> Thank you for working on this and CC'ing me on it.  This is related to
> the discussion Christian and I had in September:
>
> https://lore.kernel.org/all/20210913100140.bxqlg47pushoqa3r@wittgenstein/
>
> Christian was going to revert 2863643fb8b9, but apparently that never
> happened.  Back then, I also suggested:
>
> "Alternatively, we could postpone the set_user() calls until we're
> running with the new user's capabilities, but that's an invasive change
> that's likely to create its own issues."

Back then you mentioned that apache suexec was broken.  Do you have
any more details?

I would like to make certain the apache suexec issue is fixed but
without a few details I can't do that.  I tried looking but I can't
find an public report about apache suexec being broken.

My goal is to come up with a very careful and conservative set of
patches that fix all of the known issues with RLIMIT_NPROC.

Eric
