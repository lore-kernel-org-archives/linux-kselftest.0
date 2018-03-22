From: ravi.bangoria at linux.vnet.ibm.com (Ravi Bangoria)
Date: Thu, 22 Mar 2018 16:19:46 +0530
Subject: [PATCH v6 21/21] perf-probe: Add array argument support
In-Reply-To: <20180322182347.ca1aab9b77ab4c351100646b@kernel.org>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
 <152129118998.31874.16273532808298489908.stgit@devbox>
 <8c02c538-4934-59c2-7795-9058ce57e625@linux.vnet.ibm.com>
 <20180322182347.ca1aab9b77ab4c351100646b@kernel.org>
Message-ID: <8b3ad72c-f28c-8fc0-32b8-4401dbe16358@linux.vnet.ibm.com>

Hi Masami :)

On 03/22/2018 03:53 PM, Masami Hiramatsu wrote:
> On Mon, 19 Mar 2018 13:29:59 +0530
> Ravi Bangoria <ravi.bangoria at linux.vnet.ibm.com> wrote:
>
>>
>> Is it okay to allow user to specify array size with type field?
> Fro this patch, yes.

So IIUC, perf _tool_ will allow user to record array either with "name[range]"
or by "name:type[length]". Please correct me if that's wrong.

And If perf tool will allow array length along with TYPE field, I guess we should
document that in man perf-probe?

Otherwise,

Acked-by: Ravi Bangoria <ravi.bangoria at linux.vnet.ibm.com>

Thanks,
Ravi

>  The availability of type is checked only when
> it is automatically generated.
> IMO, it should be done in another patch, something like
> "Validate user specified type casting" patch. Would you need it?
>
> Thank you,
>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
