package velluscinum;

import group.chon.velluscinum.Api;
import velluscinum.util.JasonUtil;
import jason.asSemantics.DefaultInternalAction;
import jason.asSemantics.Message;
import jason.asSemantics.TransitionSystem;
import jason.asSemantics.Unifier;
import jason.asSyntax.Literal;
import jason.asSyntax.Term;

/**
 *  .transferToken(Server,Prk,Puk,MyCoin,BobKey,50,transferBelief).
 */
public class transferToken extends DefaultInternalAction {
    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        JasonUtil util = new JasonUtil();
        Api api = new Api();
        if(args.length==7||args.length==6){
            String[] arrayArgs = util.toArray(args);
            Integer amount = Integer.parseInt(arrayArgs[5]);
            while (util.isLocked());
            util.lock(true);
            String transferTokenID = api.transfer(
                    arrayArgs[0],
                    arrayArgs[1],
                    arrayArgs[2],
                    arrayArgs[3],
                    arrayArgs[4],
                    amount
            );
            util.lock(false);
            if(transferTokenID!=null){
                if(args.length==7){
                    Message m = new Message("tell",
                            ts.getAgArch().getAgName(),
                            ts.getAgArch().getAgName(),
                            Literal.parseLiteral(util.newBelief(arrayArgs[args.length-1],transferTokenID )));
                            //Literal.parseLiteral(util.newBelief(arrayArgs[args.length-1],transferTokenID ));
                    ts.getAgArch().sendMsg(m);
                }
                return true;
            }else{
                return false;
            }
        }else{
            ts.getAg().getLogger().info("Input error");
            return false;
        }
        }

    }