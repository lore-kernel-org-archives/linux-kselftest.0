From: joe.lawrence at redhat.com (Joe Lawrence)
Date: Fri, 13 Apr 2018 16:52:25 -0400
Subject: [PATCH v3] selftests/livepatch: introduce tests
In-Reply-To: <alpine.LSU.2.21.1804131118080.17969@pobox.suse.cz>
References: <1523544871-29444-1-git-send-email-joe.lawrence@redhat.com>
 <1523544871-29444-2-git-send-email-joe.lawrence@redhat.com>
 <alpine.LSU.2.21.1804131118080.17969@pobox.suse.cz>
Message-ID: <c9f4b440-c672-e45f-ddcc-63548b0411e2@redhat.com>

On 04/13/2018 07:20 AM, Miroslav Benes wrote:
> Hi,
> 
> On Thu, 12 Apr 2018, Joe Lawrence wrote:
> 
>> Add a few livepatch modules and simple target modules that the included
>> regression suite can run tests against.
> 
> Could you include a brief description which features are tested?

I can add this to the commit msg:

      - basic livepatching (multiple patches, atomic replace)
      - pre/post (un)patch callbacks
      - shadow variable API

Or do you prefer a little more detail?

>  
>> Signed-off-by: Joe Lawrence <joe.lawrence at redhat.com>
>> ---
> 
>> diff --git a/lib/livepatch/test_klp_shadow_vars.c b/lib/livepatch/test_klp_shadow_vars.c
>> new file mode 100644
>> index 000000000000..18c75b21cb9e
>> --- /dev/null
>> +++ b/lib/livepatch/test_klp_shadow_vars.c
>>
>> +/*
>> + * Shadow variable wrapper functions that echo the function and arguments
>> + * to the kernel log for testing verification.  Don't display raw pointers,
>> + * but use the ptr_id() value instead.
>> + */
>> +void *shadow_get(void *obj, unsigned long id)
>> +{
>> +	void *ret = klp_shadow_get(obj, id);
>> +
>> +	pr_info("klp_%s(obj=PTR%d, id=0x%lx) = PTR%d\n",
>> +		__func__, ptr_id(obj), id, ptr_id(ret));
>> +
>> +	return ret;
>> +}
> 
>> +void shadow_free(void *obj, unsigned long id, klp_shadow_dtor_t dtor)
>> +{
>> +	klp_shadow_free(obj, id, dtor);
>> +	pr_info("klp_%s(obj=PTR%d, id=0x%lx, dtor=PTR%d)\n",
>> +		__func__, ptr_id(obj), id, ptr_id(dtor));
>> +}
> 
> Sparse (make C=1) would be happier with those two being static.

Ah right. I wonder why the kbuild test robot didn't complain about
those, too.  Easy enough to fix up, thanks.

> Otherwise it works as expected. Good job!

Thanks for reviewing.  I'll hold off on posting v4 until Petr (and
others) get a chance to comment.  Perhaps there are other tests that
would be helpful?

-- Joe
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
