function LoadChat(){$.get("/messages",function(e){$("#chatMessages").text("");for(var s in e){var a=e[s],n='<p class="well well-sm">'+a.user.name+": "+a.message+"</p>";$("#chatMessages").append(n)}})}$(document).on("ajax:success",".new_message",function(e){LoadChat(),$("#message_message").val("")}),setInterval(function(){LoadChat()},1100);